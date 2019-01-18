require_relative 'encoder'

module Estratto
  class Content
    def self.for(file_path)
      content = File.read(file_path)
      encoded_content = Encoder.new(content).encode
      encoded_content.split("\n")
    end
  end
end
