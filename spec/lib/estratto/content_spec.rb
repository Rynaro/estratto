RSpec.describe Estratto::Content do
  let(:file_path) { 'spec/fixtures/files/data_to_parse.txt' }

  describe '.for' do
    let(:expected_content) do
      [
        "01JOHN DOE   2018-12-25MECHANICAL KEYBOARD        375.95  123",
        "01MARY JONES 2018-12-25HEADSET 7.1                500.0012345",
        "99DONTREADTHIS",
        "025000020181225JUSTDESCRIPTION"
      ]
    end

    it "returns an Enumerator::Lazy object" do
      expect(described_class.for(file_path)).to be_a Enumerator::Lazy
    end

    it "returns the right content" do
      expect(described_class.for(file_path).to_a).to match_array expected_content
    end
  end
end
