RSpec.describe Estratto::Helpers::Range do
  subject { described_class }

  describe '#for' do
    it { expect(subject.for('0..22')).to eq(0..22) }
  end
end
