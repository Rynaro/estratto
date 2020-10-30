RSpec.describe Estratto::Helpers::RegisterEnumerator do
  subject { instance }

  let(:instance) { described_class.new(content, layout) }
  let(:content) { Estratto::Content.for(file_path) }
  let(:layout) { Estratto::Layout::Factory.fabricate(layout_path) }
  let(:file_path) { 'spec/fixtures/files/data_to_parse.txt' }
  let(:layout_path) { 'spec/fixtures/files/complete_layout.yml' }

  let(:john_doe) do
    {
      name: 'JOHN DOE',
      gifted_at: Date.new(2018, 12, 25),
      value: 375.95,
      buyed_times: 123
    }
  end
  let(:mary_jones) do
    {
      name: 'MARY JONES',
      gifted_at: Date.new(2018, 12, 25),
      value: 500.0,
      buyed_times: 12345
    }
  end
  let(:description) do
    {
      value: 500.0,
      generated_at: Date.new(2018, 12, 25),
      description: 'JUSTDESCRIPTION'
    }
  end

  it { is_expected.to be_a Enumerator::Lazy }

  describe '#to_a' do
    subject { instance.to_a }

    it 'return only rows which prefix is mapped by the layout' do
      is_expected.to eq [john_doe, mary_jones, description]
    end
  end

  describe '#each' do
    it "yields only Registers for rows which prefix is mapped by the layout" do
      expect { |block| instance.each(&block) }.to(
        yield_successive_args(john_doe, mary_jones, description)
      )
    end
  end
end
