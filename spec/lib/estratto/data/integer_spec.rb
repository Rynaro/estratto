RSpec.describe Estratto::Data::Integer do
  subject { described_class.new(data, formats) }
  let(:data) { '000000000000012345' }
  let(:formats) { {} }

  describe '#coerce' do
    it do
      expect(subject.coerce).to eq(12345)
    end
  end
end
