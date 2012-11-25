module Zeit
  module Resources
    class Product < Base
      def find(q, opts = {})
        opts[:q] = q
        @connection.get '/product' do |query|
          apply_params(query, opts)
        end
      end

      def get(id, opts = {})
        @connection.get "/product/#{id}" do |query|
          apply_params(query, opts)
        end
      end
    end
  end
end
