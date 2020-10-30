RSpec.describe Estratto::Document do
  subject { described_class }
  let(:layout_path) { 'spec/fixtures/files/complete_layout.yml' }
  let(:file_path) { 'spec/fixtures/files/data_to_parse.txt' }

  describe '#process' do
    let(:data_refined) do
      [
        {
          name: "JOHN DOE",
          gifted_at: Date.new(2018, 12, 25),
          value: 375.95,
          buyed_times: 123
        },
        {
          name: "MARY JONES",
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
      expect(subject.process(file: file_path, layout: layout_path)).to be_a Enumerator::Lazy
    end

    it "returns the right content" do
      expect(subject.process(file: file_path, layout: layout_path).to_a).to match_array data_refined
    end
  end
end
