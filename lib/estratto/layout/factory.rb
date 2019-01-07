require_relative 'multi_register'

module Estratto
  module Layout
    class LayoutUndefinedError < StandardError; end
    class Factory

      def self.fabricate(reader)
        if reader.multiregister?
          MultiRegister.new(reader)
        else
          raise LayoutUndefinedError
        end
      end
    end
  end
end
