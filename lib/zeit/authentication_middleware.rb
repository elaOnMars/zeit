module Zeit
  class AuthenticationMiddleware < Faraday::Middleware
    KEY = "X-Authorization".freeze

    # Public
    def self.key(key)
      key
    end

    # Internal
    def initialize(app, key)
      @header_value = key
      super(app)
    end

    # Public
    def call(env)
      unless env[:request_headers][KEY]
        env[:request_headers][KEY] = @header_value
      end
      @app.call(env)
    end
  end
end

