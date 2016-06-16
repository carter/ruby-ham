require 'open-uri'
require 'json'
require 'geocoder'

class APRSfi
  def self.last_location_for(callsign)
    json = JSON.load(open("http://api.aprs.fi/api/get?name=#{callsign}&what=loc&apikey=88918.o95YwnfbiYjR15F&format=json"))
    if json['entries'].any?
      result = json['entries'][0]
      result['time'] = Time.at(result['time'].to_i)
      result['geocoded'] = Geocoder.search([result['lat'].to_f, result['lng'].to_f])
      return result
    end
  end
end
