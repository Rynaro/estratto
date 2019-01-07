require_relative 'integer'
require_relative 'float'
require_relative 'datetime'
require_relative 'date'
require_relative 'string'

module Estratto
  module Data
    class Coercer
      attr_reader :data, :type, :formats

      def initialize(data:, type: 'String', formats: {})
        @data = data
        @type = type
        @formats = formats
      end

      def build
        target_coercer.coerce
      end

      def target_coercer
        Object.const_get("Estratto::Data::#{type}").new(data, formats)
      end
    end
  end
end
