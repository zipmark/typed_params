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

  describe "#find" do
    subject { rules_format.find(path) }

    let(:path) { %w(data attributes) }
    let(:rule) do
      TypedParameters::Rule.new(path, rules['data']['attributes'])
    end

    context "when there a rule at the given path" do
      context "when the path argument mixes symbols and strings" do
        let(:path) { [ :data, "attributes" ] }

        it { is_expected.to eq rule }
      end

      it "returns the rule instance at the path" do
        expect(subject).to eq rule
      end
    end

    context "when there is no rule at the given path" do
      let(:path) { %w(foo bar) }

      it "raises an error" do
        expect { subject }.to raise_error TypedParameters::RuleNotFound
      end
    end
  end
end
