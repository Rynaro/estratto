module Estratto
  module Helpers
    class Range
      def self.for(string)
        ::Range.new(*string.split('..').map(&:to_i))
      end
    end
  end
end
