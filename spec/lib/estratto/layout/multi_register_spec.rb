RSpec.describe Estratto::Layout::MultiRegister do
  subject { described_class.new(reader) }
  let(:reader) { Estratto::Layout::Reader.new(layout_path) }
  let(:layout_path) { 'spec/fixtures/files/simple_layout.yml' }

  describe '#prefix_range' do
    it { expect(subject.prefix_range).to eq(0..1) }
  end

  describe '#register_fields_for' do
    context 'has fields for prefix' do
      let(:fields) do
        [
          { 'name' => 'name', 'range' => '2..12', 'type' => 'String' },
          { 'name' => 'product_id', 'range' => '13..21', 'type' => 'Integer' }
        ]
      end

      it do
        expect(subject.register_fields_for('01')).to eq(fields)
      end
    end

    context 'hasnt fields for prefix' do
      it do
        expect(subject.register_fields_for('99')).to be_nil
      end
    end
  end

end
