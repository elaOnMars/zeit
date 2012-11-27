module Zeit
  module Resources
    class Series < Base
      def find(q, opts = {})
        opts[:q] = q
        @connection.get '/series' do |query|
          apply_params(query, opts)
        end
      end

      def get(id, opts = {})
        @connection.get "/series/#{id}" do |query|
          apply_params(query, opts)
        end
      end
    end
  end
end
