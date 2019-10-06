require_relative 'base'

module Estratto
  module Data
    class Integer < Base
      def coerce
        data.to_i
      end
    end
  end
end
