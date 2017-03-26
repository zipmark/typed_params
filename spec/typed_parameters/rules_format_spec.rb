require 'spec_helper'

RSpec.describe TypedParameters::RulesFormat do
  let(:rules) do
    {
      'data' => {
        'type' => "users",
        'attributes' => {
          'name'  => String,
          'email' => String
        }
      }
    }
  end

  subject(:rules_format) { described_class.new(rules) }

  describe "#rule_at" do
    let(:path) { %w(data attributes) }
    subject { rules_format.rule_at(path) }

    context "when the path argument mixes symbols and strings" do
      let(:path) { [ :data, "attributes" ] }

      it { is_expected.to eq rules["data"]["attributes"] }
    end

    it "finds the value at the given keys" do
      expect(subject).to eq rules["data"]["attributes"]
    end
  end
end
