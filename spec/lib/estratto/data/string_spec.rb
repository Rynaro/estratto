RSpec.describe Estratto::Data::String do
  subject { described_class.new(data, formats) }
  let(:data) { 'hermit purple      ' }
  let(:formats) { {} }

  describe '#coerce' do
    context 'without formats' do
      it do
        expect(subject.coerce).to eq('hermit purple      ')
      end
    end

    context 'with strip format' do
      let(:formats) { { 'strip' => true } }
      it do
        expect(subject.coerce).to eq('hermit purple')
      end
    end
  end
end
