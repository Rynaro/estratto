require_relative 'register'

module Estratto
  class Parser
    attr_reader :file_path, :layout

    def initialize(file_path, layout)
      @file_path = file_path
      @layout = layout
    end

    def perform
      @data ||= raw_data.map do |line|
        register_layout = layout.register_fields_for(line[layout.prefix_range])
        next if register_layout.nil?
        Register.new(line, register_layout).refine
      end.compact
    end

    def raw_data
      @raw_data ||= File.open(file_path, 'r')
    end

  end
end
