require_relative '../register'

module Estratto
  module Helpers
    class RegisterEnumerator < Enumerator::Lazy
      def initialize(raw_content, layout)
        super(raw_content.each_with_index) do |yielder, (line, index)|
          register_layout = layout.register_fields_for(line[layout.prefix_range])
          next if register_layout.nil?

          register = Register.new(line, index, register_layout).refine

          if block_given?
            yield register
          else
            yielder << register
          end
        end
      end
    end
  end
end
