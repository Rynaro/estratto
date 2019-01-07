require_relative 'base'
require_relative '../helpers/range'

module Estratto
  module Layout
    class LayoutNotFoundForPrefix < StandardError; end

    class MultiRegister < Base

      def prefix_range
        Estratto::Helpers::Range.for(layout['prefix'])
      end

      def register_fields_for(prefix)
        find_register(prefix)&.dig('fields')
      end

      private

      def find_register(prefix)
        registers.find { |register| register['register'] == prefix }
      end

    end
  end
end
