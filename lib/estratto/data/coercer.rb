require_relative 'integer'
require_relative 'float'
require_relative 'datetime'
require_relative 'date'
require_relative 'string'

module Estratto
  module Data
    class InvalidCoercionType < StandardError; end
    class DataCoercionError < StandardError; end
    class Coercer
      attr_reader :data, :index, :type, :formats

      def initialize(data:, index:, type: 'String', formats: {})
        @data = data
        @index = index
        @type = type
        @formats = formats
      end

      def build
        target_coercer.coerce
      rescue StandardError => error
        raise DataCoercionError,
              "Error when coercing #{data} on line #{index}, raising: #{error.message}"
      end

      def target_coercer
        Object.const_get("Estratto::Data::#{type}").new(data, formats)
      rescue NameError
        raise InvalidCoercionType
      end
    end
  end
end
