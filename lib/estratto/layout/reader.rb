require 'yaml'

module Estratto
  module Layout
    class Reader
      attr_reader :file

      def initialize(file)
        @file = file
      end

      def template
        @template ||= YAML.load_file(file)
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
