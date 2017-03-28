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

    context "when there is no rule at the given path" do
      let(:path) { %w(foo bar) }

      it "raises an error" do
        expect { subject }.to raise_error TypedParameters::RuleNotFound
      end
    end

    context "when the path argument mixes symbols and strings" do
      let(:path) { [ :data, "attributes" ] }

      it { is_expected.to eq TypedParameters::Rule.new([:data, 'attributes'], rules['data']['attributes']) }
    end

    it "determines the rule's condition at that location" do
      expect(subject).to eq TypedParameters::Rule.new(['data', 'attributes'], rules['data']['attributes'])
    end
  end
end
