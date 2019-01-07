require_relative 'base'

module Estratto
  module Data
    class Date < DateTime
      def coerce
        super.to_date
      end
    end
  end
end
