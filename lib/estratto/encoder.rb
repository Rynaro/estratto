require 'charlock_holmes'

module Estratto
  class Encoder
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def encode
      content.lazy.map do |line|
        charset = detect(line)
        CharlockHolmes::Converter.convert(line, charset[:encoding], 'UTF-8')
      end
    end

    private

    def detect(line)
      CharlockHolmes::EncodingDetector.detect(line)
    end
  end
end
