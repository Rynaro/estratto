RSpec.describe Estratto::Data::Base do
  subject { described_class.new(data: data, formats: formats) }
  let(:data) { 'basestring' }
  let(:formats) { {} }

  describe '#coerce' do
    it do
      expect{ subject.coerce }.to(
        raise_error(Estratto::Data::TypeCoercionNotFound)
      )
    end
  end
end
