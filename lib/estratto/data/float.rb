require_relative 'base'

module Estratto
  module Data
    class Float < Base

      def coerce
        if expected_comma
          from_comma_data
        elsif custom_precision
          from_precision_data
        else
          data.to_f
        end
      end

      private

      def expected_comma
        formats.dig('comma_format') || false
      end

      def custom_precision
        formats.has_key?('precision')
      end

      def from_comma_data
        data.gsub('.', '').gsub(',', '.').to_f
      end

      def from_precision_data
        data.to_f / (10**precision)
      end

      def precision
        formats['precision'].to_i || 2
      end
    end
  end
end
