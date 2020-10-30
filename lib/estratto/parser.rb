require_relative 'content'
require_relative 'helpers/register_enumerator'

module Estratto
  class Parser
    attr_reader :file_path, :layout

    def initialize(file_path, layout)
      @file_path = file_path
      @layout = layout
    end

    def perform
      @data ||= Helpers::RegisterEnumerator.new(raw_content, layout)
    end

    def raw_content
      @raw_data = Content.for(file_path)
    end
  end
end
