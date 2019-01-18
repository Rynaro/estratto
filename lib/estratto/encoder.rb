require 'charlock_holmes'

module Estratto
  class Encoder
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def encode
      CharlockHolmes::Converter.convert(content, encoding, 'UTF-8')
    end

    private

    def encoding
      CharlockHolmes::EncodingDetector.detect(content)[:encoding]
    end
  end
end
