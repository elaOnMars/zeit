module Zeit
  module Resources
    class Base
      attr_accessor :query
      attr_accessor :fields
      attr_accessor :limit
      attr_accessor :offset

      def initialize(connection)
        @connection = connection
        @fields = []
      end
    end
  end
end
