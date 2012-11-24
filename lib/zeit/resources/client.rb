module Zeit
  module Resources
    class Client < Base
      def client
        @connection.get '/client' do |request|
        end
      end
    end
  end
end
