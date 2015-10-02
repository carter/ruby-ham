require './n0nbh'
require 'vcr'

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

RSpec.describe N0nbh do
  use_vcr_cassette "solar_conditions"
  
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
end
