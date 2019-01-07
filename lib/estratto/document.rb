require_relative 'layout/factory'
require_relative 'parser'

module Estratto
  class Document
    class << self
      def process(layout:,file:)
        layout_fabricated = Layout::Factory.fabricate(layout)
        Parser.new(file, layout_fabricated).perform
      end
    end
  end
end
