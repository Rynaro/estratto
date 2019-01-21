RSpec.describe Estratto::Encoder do
  subject { described_class.new(original_content) }

  context 'ISO-8859-1 original encoding' do
    let(:original_content) { "026000020181227DESCRI\xC7\xC3O\n" }
    let(:encoded_content) { "026000020181227DESCRIÇÃO\n" }

    it 'converts the original content to UTF-8' do
      expect(subject.encode).to eq(encoded_content)
    end
  end

  context 'UTF-8 original encoding' do
    let(:original_content) { "025000020181225JUSTDESCRIPTION\n" }

    it 'keeps the original content' do
      expect(subject.encode).to eq(original_content)
    end
  end
end
