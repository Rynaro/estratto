module Estratto
  module Layout
    class Base
      extend Forwardable

      attr_reader :reader
      def_delegators :@reader, :layout, :registers

      def initialize(reader)
        @reader = reader
      end
    end
  end
end
