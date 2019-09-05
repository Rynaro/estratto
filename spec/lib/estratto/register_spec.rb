RSpec.describe Estratto::Register do
  subject { described_class.new(line, index, layout) }
  let(:line) { '42FIREFOX    57192     0.6' }

  let(:layout) do
    [
      { 'name' => 'browser', 'range' => '2..10', 'type' => 'String' },
      { 'name' => 'user_count', 'range' => '11..17', 'type' => 'Integer' },
      { 'name' => 'acceptance', 'range' => '18..25', 'type' => 'Float' }
    ]
  end

  let(:index) { 1 }

  describe '#refine' do
    it do
      expect(subject.refine).to eq(
        { browser: 'FIREFOX  ', user_count: 57192, acceptance: 0.6 }
      )
    end
  end
end
