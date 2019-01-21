require_relative 'register'
require_relative 'content'

module Estratto
  class Parser
    attr_reader :file_path, :layout

    def initialize(file_path, layout)
      @file_path = file_path
      @layout = layout
    end

    def perform
      @data ||= raw_content.map do |line|
        register_layout = layout.register_fields_for(line[layout.prefix_range])
        next if register_layout.nil?
        Register.new(line, register_layout).refine
      end.compact
    end

    def raw_content
      @raw_data = Content.for(file_path)
    end
  end
end
