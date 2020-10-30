RSpec.describe Estratto::Document do
  subject { described_class }
  let(:file_path) { 'spec/fixtures/files/data_to_parse.txt' }

  describe '#process' do
    subject { described_class.process(file: file_path, layout: layout_path) }

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

    context "when given a file path as the layout: argument" do
      let(:layout_path) { 'spec/fixtures/files/complete_layout.yml' }

      it do
        expect(subject).to eq(data_refined)
      end
    end

    context "when given a Hash as the layout: argument" do
      let(:layout_path) do
        {
          layout: {
            'multi-register': true,
            prefix: '0..1',
            registers: [
              {
                register: '01',
                fields: [
                  {
                    name: 'name',
                    range: '2..12',
                    type: 'String',
                    formats: {
                      strip: true
                    }
                  }, {
                    name: 'gifted_at',
                    range: '13..22',
                    type: 'Date',
                    formats:{
                      format: '%Y-%m-%d'
                    }
                  }, {
                    name: 'value',
                    range: '50..55',
                    type: 'Float'
                  }, {
                    name: 'buyed_times',
                    range: '56..61',
                    type: 'Integer'
                  }
                ]
              }, {
                register: '02',
                fields: [
                  {
                    name: 'value',
                    range: '2..6',
                    type: 'Float',
                    formats:{
                      precision: 2
                    }
                  }, {
                    name: 'generated_at',
                    range: '7..14',
                    type: 'Date',
                    formats: {
                      format: '%Y%m%d'
                    }
                  }, {
                    name: 'description',
                    range: '15..29',
                    type: 'String'
                  }
                ]
              }
            ]
          }
        }
      end

      it do
        expect(subject).to eq(data_refined)
      end
    end
  end
end
