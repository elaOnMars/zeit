module Zeit
  module Resources
    class Author < Base
      def find(query, opts = {})
        @connection.get '/author' do |query|
          apply_params(query, opts)
        end
      end

      def get(id, opts = {})
        @connection.get "/author/#{id}" do |query|
          apply_params(query, opts)
        end
      end
    end
  end
end
