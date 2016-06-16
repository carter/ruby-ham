require './lib/n0nbh'
require 'vcr'

RSpec.describe N0nbh do
  use_vcr_cassette "solar_conditions", :allow_playback_repeats => true
  
  describe "#band_conditions" do
    it "should return an indication of the band conditions" do
      expect(N0nbh.band_conditions("30m-20m", :night)).to eq("Good")
      expect(N0nbh.band_conditions("12m-10m", :day)).to eq("Poor")
    end
  end

  describe "#[]" do
    it "should return the value in the brackets" do
      expect(N0nbh['solarflux']).to eq("114")
    end
  end

  describe "#last_update" do
    it "should return the time of the last update" do
      skip
      expect(N0nbh.last_update).to eq('fdsa') 
    end
  end

  describe "#needs_update" do
    it "should return false" do
      expect(N0nbh.needs_update?).to be true
    end
  end
end
