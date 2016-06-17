require 'open-uri'
require 'json'

class DXWatch

  def self.spots_for(callsign)
    dxw_url = "http://www.dxwatch.com/dxsd1/s.php?s=0&r=40&cdx=#{callsign}"
    dxw_json = JSON.load(open(dxw_url))
    rbn_url = "http://www.reversebeacon.net/dxsd1/sk.php?s=0&r=15&cdx=#{callsign}"
    rbn_json = JSON.load(open(rbn_url))

    data = []
    if dxw_json['s']
      dxw_json['s'].each_pair do |key, v|
        time = v[4]
        hour = time[0..1]
        minute = time[2..3]
        date = time.match(/(.*)z (.*)/)[2]
        parsed = DateTime.parse("#{hour}:#{minute} utc #{date}").to_time
        next if parsed > Time.now
        data << {
          id: key,
          de: v[0],
          frequency: v[1],
          dx: v[2],
          comment: v[3],
          time: parsed,
          original_time: v[4],
          on: "DX Watch"
        }
      end
    end
    if rbn_json['s']
      rbn_json['s'].each_pair do |key, v|
        time = v[5]
        hour = time[0..1]
        minute = time[2..3]
        date = time.match(/(.*)z (.*)/)[2]
        parsed = DateTime.parse("#{hour}:#{minute} utc #{date}").to_time
        next if parsed > Time.now
        data << {
          id: key,
          de: v[0],
          frequency: v[1],
          dx: v[2],
          db: v[3],
          wpm: v[4],
          comment: "#{v[3]}dB #{v[4]}wpm",
          time: parsed,
          original_time: v[5], 
          on: 'RBN'

        }
      end
    end
    return data.sort {|y, x| x[:time] <=> y[:time] }
  end
end
