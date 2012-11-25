module Zeit
  module Resources
    class Keyword < Base
      def find(q, opts = {})
        opts[:q] = q
        @connection.get '/keyword' do |query|
          apply_params(query, opts)
        end
      end

      def get(id, opts = {})
        @connection.get "/keyword/#{id}" do |query|
          apply_params(query, opts)
        end
      end
    end
  end
end

