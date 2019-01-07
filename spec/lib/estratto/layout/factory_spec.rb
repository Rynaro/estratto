RSpec.describe Estratto::Layout::Factory do
  subject { described_class }

  describe '#fabricate' do

    context 'multiregister layout' do
      let(:reader) { double(:reader, multiregister?: true ) }

      it do
        expect(Estratto::Layout::Reader).to receive(:new).with('layout_path').and_return(reader)
        expect(subject.fabricate('layout_path')).to be_a(Estratto::Layout::MultiRegister)
      end
    end

    context 'layout undefined' do
      let(:reader) { double(:reader, multiregister?: false) }

      it do
        expect(Estratto::Layout::Reader).to receive(:new).with('layout_path').and_return(reader)
        expect{ subject.fabricate('layout_path') }.to raise_error(Estratto::Layout::LayoutUndefinedError)
      end
    end
  end
end
