require 'zeit'
require 'json'

RSpec.configure do |c|
  # VCR:
  # so we can use :vcr rather than :vcr => true;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

def authorized_api_client
  key = ENV['ZEIT_API_KEY'] || 'working'
  Zeit::API.new api_key: key
end

def unauthorized_api_client
  Zeit::API.new api_key: 'felix_von_springer' # bild.css
end

