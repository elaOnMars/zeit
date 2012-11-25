module Zeit
  module Resources
    class Department < Base
      def find(q, opts = {})
        opts[:q] = q
        @connection.get '/department' do |query|
          apply_params(query, opts)
        end
      end

      def get(id, opts = {})
        @connection.get "/department/#{id}" do |query|
          apply_params(query, opts)
        end
      end
    end
  end
end

