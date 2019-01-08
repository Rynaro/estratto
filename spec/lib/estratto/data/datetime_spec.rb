RSpec.describe Estratto::Data::DateTime do
  subject { described_class.new(data, formats) }
  let(:data) { '2018-01-01' }
  let(:formats) { {} }

  describe '#coerce' do
    context 'default datetime pattern' do
      it do
        expect(subject.coerce).to eq(DateTime.new(2018, 1, 1))
      end
    end

    context 'with dd/mm/YYYY pattern' do
      let(:data) { '01/01/2018' }
      let(:formats) { { 'format' => '%d/%m/%Y' } }

      it do
        expect(subject.coerce).to eq(DateTime.new(2018, 1, 1))
      end
    end
  end
end
