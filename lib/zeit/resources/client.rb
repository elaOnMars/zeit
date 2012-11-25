module Zeit
  module Resources
    class Client < Base
      def get
        @connection.get '/client'
      end

      alias_method :client, :get
    end
  end
end
