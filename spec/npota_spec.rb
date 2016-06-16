require './lib/npota'

RSpec.describe NPOTA do
  use_vcr_cassette "npota_activations", :allow_playback_repeats => true
  subject { NPOTA }
  describe "#activations" do
    it "should return upcoming NPOTA Activations" do
      expect(subject.activations[0]['ActivationCallSign']).to eq('WB6VYH')
    end
  end
  
  describe "#activations_by_callsign" do
    it "should only return activations for that callsign" do
      expect(subject.activations_by_callsign('N3BBQ')[0]['ActivationCallSign']).to eq('N3BBQ')
    end
  end
end
