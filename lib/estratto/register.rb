require_relative 'data/coercer'
require_relative 'helpers/range'

module Estratto
  class Register
    attr_reader :line, :register_layout

    def initialize(line, register_layout)
      @line = line
      @register_layout = register_layout
    end

    def refine
      register_layout.map do |layout|
        {
          layout['name'].to_sym => coerced_data(layout['range'], layout['type'], layout['formats'])
        }
      end.inject(&:merge)
    end

    private

    def coerced_data(range, type, formats)
      Estratto::Data::Coercer.new(
        data: line[Estratto::Helpers::Range.for(range)],
        type: type,
        formats: formats || {}
      ).build
    end
  end
end
