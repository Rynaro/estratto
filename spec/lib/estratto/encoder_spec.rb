RSpec.describe Estratto::Encoder do
  let(:instance) { described_class.new(original_content) }

  describe "#encode" do
    subject { instance.encode }

    context 'ISO-8859-1 original encoding' do
      let(:original_content) { ["026000020181227DESCRI\xC7\xC3O\n"] }
      let(:encoded_content) { ["026000020181227DESCRIÇÃO"] }

      it 'converts the original content to UTF-8' do
        expect(subject.to_a).to match_array encoded_content
      end
    end

    context 'UTF-8 original encoding' do
      let(:original_content) { ["025000020181225JUSTDESCRIPTION\n"] }
      let(:encoded_content) { ["025000020181225JUSTDESCRIPTION"] }

      it 'keeps the original content' do
        expect(subject.to_a).to match_array encoded_content
      end
    end
  end
end
