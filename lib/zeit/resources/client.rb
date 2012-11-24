module Zeit
  module Resources
    class Client < Base
      def client
        raw_client
      end

      def raw_client
        @connection.get '/client' do |request|
        end
      end

      alias_method :get, :client
    end
  end
end
