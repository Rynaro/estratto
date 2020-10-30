RSpec.describe Estratto::Parser do
  subject { described_class.new(file_path, register_layout) }
  let(:register_layout) { Estratto::Layout::MultiRegister.new(reader) }
  let(:reader) { Estratto::Layout::Reader.new(layout_path) }
  let(:layout_path) { 'spec/fixtures/files/complete_layout.yml' }

  describe '#perform' do
    context 'UTF-8 encoded file' do
      let(:file_path) { 'spec/fixtures/files/data_to_parse.txt' }
      let(:data_refined) do
        [
          {
            name: "JOHN DOE",
            gifted_at: Date.new(2018, 12, 25),
            value: 375.95,
            buyed_times: 123
          },
          {
            name:"MARY JONES",
            gifted_at: Date.new(2018, 12, 25),
            value: 500.0,
            buyed_times: 12345
          },
          {
            value: 500.0,
            generated_at: Date.new(2018, 12, 25),
            description: 'JUSTDESCRIPTION'
          }
        ]
      end

      it "returns an Enumerator::Lazy object" do
        expect(subject.perform).to be_a Estratto::Helpers::RegisterEnumerator
      end

      it "returns the right content" do
        expect(subject.perform.to_a).to match_array data_refined
      end
    end

    context 'ISO-8859-1 encoded file' do
      let(:file_path) { 'spec/fixtures/files/iso_8859_data_to_parse.txt' }
      let(:data_refined) do
        [
          {
            value: 600.0,
            generated_at: Date.new(2018, 12, 27),
            description: 'DESCRIÇÃO'
          }
        ]
      end

      it "returns an Enumerator::Lazy object" do
        expect(subject.perform).to be_a Enumerator::Lazy
      end

      it "returns the right content" do
        expect(subject.perform.to_a).to match_array data_refined
      end
    end
  end
end
