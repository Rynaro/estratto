require_relative 'reader'
require_relative 'multi_register'

module Estratto
  module Layout
    class LayoutUndefinedError < StandardError; end
    class Factory

      def self.fabricate(layout_path)
        reader = Reader.new(layout_path)
        if reader.multiregister?
          MultiRegister.new(reader)
        else
          raise LayoutUndefinedError
        end
      end
    end
  end
end
