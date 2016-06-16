require './lib/aprsfi'

RSpec.describe APRSfi do
  use_vcr_cassette "aprsfi_location", :allow_playback_repeats => true
  subject {APRSfi}

  describe "#last_location_for" do
    it "should return a callsign's last location" do
      expect(subject.last_location_for('N3BBQ-9')['lat']).to eq('35.88417') 
      expect(subject.last_location_for('N3BBQ-9')['geocoded'].first.address).to eq('NM-502, Santa Fe, NM 87506, USA') 
    end
  end
end
