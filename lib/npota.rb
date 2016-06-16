require 'open-uri'
require 'json'

class NPOTA
  @@activations_url = 'https://npota.arrl.org/resources/api/get-10-day-activations-api.php'

  def self.activations
    JSON.load(open(@@activations_url))
  end

  def self.activations_by_callsign(callsign)
    self.activations.select {|a| a['ActivationCallSign'].upcase == callsign.upcase }
  end
end
