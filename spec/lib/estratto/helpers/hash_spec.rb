RSpec.describe Estratto::Helpers::Hash do
  subject { described_class }

  describe '.deep_transform_keys' do
    let(:original) do
      {
        a_key: 'a value',
        "another_key" => "another value",
        go_deeper: {
          inner_key: :inner_value,
          even_deeper: [
            [{ what: 'are you doing?' }],
            { ok: "this is just crazy" }
          ]
        },
      }
    end
    let(:transformed) do
      {
        "a_key" => 'a value',
        "another_key" => "another value",
        "go_deeper" => {
          "inner_key" =>  :inner_value,
          "even_deeper" => [
            [
              {
                "what" => 'are you doing?'
              }
            ],
            { "ok" => "this is just crazy" }
          ]
        },
      }
    end

    it "works for explicit blocks" do
      expect(
        described_class.deep_transform_keys(original) { |key| key.to_s }
      ).to match transformed
    end

    it "works for implicit blocks" do
      expect(described_class.deep_transform_keys(original, &:to_s)).to match transformed
    end
  end
end
