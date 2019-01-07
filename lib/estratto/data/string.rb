require_relative 'base'

module Estratto
  module Data
    class String < Base

      def coerce
        if strip_value?
          stripped_data
        else
          data
        end
      end

      private

      def strip_value?
        formats.dig('strip') || false
      end

      def stripped_data
        data.strip
      end
    end
  end
end
