module Zeit
  class API

    def initialize(params = {})
      @api_key         = params[:api_key]
      @debug           = params[:debug]
      @base_url        = params[:base_url]        || 'http://api.zeit.de/'
      @faraday_adapter = params[:faraday_adapter] || Faraday.default_adapter
      @faraday         = params[:faraday]         || default_faraday

      raise ArgumentError, ':api_key missing' unless @api_key
    end

    def connection
      @faraday
    end

    def author(opts = {})
      Zeit::Resources::Author.new(connection, opts)
    end

    def client(opts = {})
      Zeit::Resources::Client.new(connection, opts)
    end

    def content(opts = {})
      Zeit::Resources::Content.new(connection, opts)
    end

    def department(opts = {})
      Zeit::Resources::Department.new(connection, opts)
    end

    def keyword(opts = {})
      Zeit::Resources::Keyword.new(connection, opts)
    end

    def product(opts = {})
      Zeit::Resources::Product.new(connection, opts)
    end

    def series(opts = {})
      Zeit::Resources::Series.new(connection, opts)
    end

    private

    def default_faraday
      Faraday.new(:url => @base_url) do |faraday|
        faraday.use      Zeit::AuthenticationMiddleware, @api_key
        faraday.request  :url_encoded
        faraday.response :json
        faraday.response(:logger) if @debug
        faraday.adapter @faraday_adapter
      end
    end
  end
end
