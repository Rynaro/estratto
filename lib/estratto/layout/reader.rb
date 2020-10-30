require 'yaml'

require_relative '../helpers/hash'

module Estratto
  module Layout
    class Reader
      attr_reader :template_source

      def initialize(template_source)
        @template_source = template_source
      end

      def template
        @template ||= begin
          if template_source.is_a?(Hash)
            Estratto::Helpers::Hash.deep_transform_keys(template_source, &:to_s)
          elsif template_source.is_a?(String)
            YAML.load_file(template_source)
          end
        end
      end

      def layout
        template['layout']
      end

      def registers
        @registers ||= layout['registers']
      end

      def multiregister?
        layout.dig('multi-register') || false
      end
    end
  end
end
