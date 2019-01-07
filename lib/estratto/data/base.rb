module Estratto
  module Data
    class TypeCoercionNotFound < StandardError; end

    class Base
      attr_reader :data, :formats

      def initialize(data, formats = {})
        @data = data
        @formats = formats
      end

      def coerce
        raise TypeCoercionNotFound
      end

    end
  end
end
