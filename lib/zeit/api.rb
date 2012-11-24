require 'faraday'

module Zeit
  class API

    def initialize(params = {})
      @api_key  = params[:api_key]
      @base_url = params[:base_url] || 'http://api.zeit.de:80/'

      connection
    end

    def connection
      @connection ||= Faraday.new(url: @base_url) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def author
      Zeit::Resources::Author.new connection
    end

    def client
      Zeit::Resources::Client.new connection
    end

  end
end
