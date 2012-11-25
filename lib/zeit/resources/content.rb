module Zeit
  module Resources
    class Content < Base
      def find(q, opts = {})
        opts[:q] = q
        @connection.get '/content' do |query|
          apply_params(query, opts)
        end
      end

      def get(id, opts = {})
        @connection.get "/content/#{id}" do |query|
          apply_params(query, opts)
        end
      end
    end
  end
end

