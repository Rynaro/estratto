RSpec.describe Estratto::Data::Coercer do
  subject { described_class.new(data: data, index: index, type: type, formats: formats) }
  let(:data) { 'STAR PLATINUM' }
  let(:index) { 1 }
  let(:type) { 'String' }
  let(:formats) { {} }

  describe '#build' do
    context 'valid coercion build' do
      it do
        expect(subject.build).to eq('STAR PLATINUM')
      end
    end

    context 'invalid coercion build' do
      let(:data) { '20190910' }
      let(:type) { 'Date' }
      it do
        expect{ subject.build }.to raise_error(
          Estratto::Data::DataCoercionError,
          'Error when coercing 20190910 on line 1, raising: invalid date'
        )
      end
    end

    context 'invalid coercion type' do
      let(:data) { '0xC' }
      let(:type) { 'Octal' }
      it do
        expect{ subject.build }.to raise_error(
          Estratto::Data::DataCoercionError,
          'Error when coercing 0xC on line 1, raising: Does not exists coercer class for Octal'
        )
      end
    end

    context 'allow empty data from invalid data coerce' do
      let(:data) { '        ' }
      let(:type) { 'DateTime' }
      let(:formats) { { allow_empty?: true } }
      it do
        expect(subject.build).to be_nil
      end
    end
  end

  describe '#target_coercer' do
    context 'valid coercion' do
      it { expect(subject.target_coercer).to be_a(Estratto::Data::String) }
    end

    context 'invalid coercion' do
      let(:type) { 'Octal' }

      it do
        expect{ subject.target_coercer }.to(
          raise_error(Estratto::Data::InvalidCoercionType)
        )
      end
    end
  end
end
