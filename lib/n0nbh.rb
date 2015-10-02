require 'open-uri'
require 'nokogiri'

class N0nbh
  @@xml_doc = nil
  @@url = "http://www.hamqsl.com/solarxml.php"
  def self.band_conditions(band, time)
    xml.at_css("calculatedconditions band[name='#{band}'][time='#{time}']").inner_html
  end

  def self.[](val)
    xml.at_css(val.to_s).inner_html.strip
  end

  def self.xml
    if needs_update?
      @@xml_doc = Nokogiri::HTML(open(@@url))
    else
      @@xml_doc
    end
  end

  def self.last_update
    time_string = @@xml_doc.at_css('updated').inner_html.strip
    format = "%d %b %Y %H%M %Z"
    return Time.strptime(time_string,format)
  end

  def self.needs_update?
    return true if !@@xml_doc
    Time.now - last_update > 3600
  end
end
