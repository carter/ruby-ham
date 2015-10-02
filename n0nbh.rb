require 'open-uri'
require 'nokogiri'

class N0nbh
  @@xml_doc 
  @@url = "http://www.hamqsl.com/solarxml.php"
  def self.band_conditions(band, time)
    xml.at_css("calculatedconditions band[name='#{band}'][time='#{time}']").inner_html
  end

  def self.[](val)
    xml.at_css(val.to_s).inner_html
  end

  def self.xml
    @@xml_doc ||= Nokogiri::HTML(open(@@url))
  end
end
