RSpec.describe Estratto::Layout::Reader do
  subject { described_class.new(template_source) }

  let(:template_source) { 'spec/fixtures/files/common.yml' }

  describe '#layout' do
    let(:layout_name) { 'common_partner_system' }

    it do
      expect(subject.layout.dig('name')).to eq(layout_name)
    end
  end

  describe '#template' do
    context 'when given a Hash as argument' do
      let(:template_source) do
        {
          layout: {
            :'multi-register' => true,
            name: 'common_partner_system',
            prefix: '0..1',
            registers: [
              {
                register: 01,
                fields:[
                  {
                    name: 'first_column',
                    range: '2..4',
                    type: 'Integer'
                  }
                ]
              }
            ]
          }
        }
      end

      it do
        expect(subject.template).not_to be_empty
      end
    end

    context "when given a file path as argument" do
      context 'layout file found' do
        it do
          expect(subject.template).not_to be_empty
        end
      end

      context 'layout file not found' do
        let(:template_source) { 'spec/fixtures/files/unexistent.yml' }

        it do
          expect{ subject.template }.to raise_error(Errno::ENOENT)
        end
      end
    end
  end

  describe '#registers' do
    let(:registers) do
      [
        {
          "register"=> "01",
          "fields"=> [
            {
              "name"=> "first_column",
              "range"=>"2..4",
              "type"=> "Integer"
            }
          ]
        }
      ]
    end

    it { expect(subject.registers).to eq(registers) }
  end

  describe '#multiregister?' do
    it { expect(subject.multiregister?).to eq(true) }
  end
end
