RSpec.describe Estratto::Data::Float do
  subject { described_class.new(data, formats) }
  let(:data) { '000012.34' }
  let(:formats) { {} }

  describe '#coerce' do
    context 'normalized float' do
      it do
        expect(subject.coerce).to eq(12.34)
      end
    end

    context 'float with comma separator' do
      let(:data) { '000012,34' }
      let(:formats) { { 'comma_format' => true } }

      it do
        expect(subject.coerce).to eq(12.34)
      end
    end

    context 'unformatted float with precision 2' do
      let(:data) { '00001234' }
      let(:formats) { { 'precision' => 2 } }

      it do
        expect(subject.coerce).to eq(12.34)
      end
    end

    context 'unformatted float with precision 3' do
      let(:data) { '00001234' }
      let(:formats) { { 'precision' => 3 } }

      it do
        expect(subject.coerce).to eq(1.234)
      end
    end
  end
end
