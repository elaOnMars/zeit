module Zeit
  module Resources
    class Author < Base
      def find(q, opts = {})
        opts[:q] = q
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
