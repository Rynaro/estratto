RSpec.describe Estratto::Parser do
  subject { described_class.new(file_path, register_layout) }
  let(:register_layout) { Estratto::Layout::MultiRegister.new(reader) }
  let(:reader) { Estratto::Layout::Reader.new(layout_path) }
  let(:layout_path) { 'spec/fixtures/files/complete_layout.yml' }
  let(:file_path) { 'spec/fixtures/files/data_to_parse.txt' }

  describe '#perform' do
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
    it do
      expect(subject.perform).to eq(data_refined)
    end
  end

end
