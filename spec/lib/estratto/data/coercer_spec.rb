RSpec.describe Estratto::Data::Coercer do
  subject { described_class.new(data: data, type: type, formats: formats) }
  let(:data) { 'STAR PLATINUM' }
  let(:type) { 'String' }
  let(:formats) { {} }

  describe '#build' do
    it do
      expect(subject.build).to eq('STAR PLATINUM')
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
