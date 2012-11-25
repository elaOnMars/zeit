module Zeit
  module Resources
    class Base
      attr_accessor :query
      attr_accessor :fields
      attr_accessor :limit
      attr_accessor :offset

      def initialize(connection, options = {})
        @connection = connection

        @limit = options[:limit] || 10
        @fields = []
      end

      private

      def apply_params(query, opts)
        apply_default_params(query)

        opts.each_pair do |key, value|
          query.params[key] = value
        end
      end

      def apply_default_params(query)
      end
    end
  end
end
