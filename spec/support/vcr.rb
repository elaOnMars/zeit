require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr/cassettes'
  c.hook_into :fakeweb
  c.configure_rspec_metadata!
end

