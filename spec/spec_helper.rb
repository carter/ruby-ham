require 'vcr'

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

