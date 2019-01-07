require_relative 'base'

module Estratto
  module Data
    class DateTime < Base

      def coerce
        parse_datetime_from
      end

      def parse_datetime_from
        ::DateTime.strptime(data, datetime_format)
      end

      private

      def datetime_format
        formats.dig('format') || '%Y-%m-%d'
      end
    end
  end
end
