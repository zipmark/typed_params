require 'spec_helper'

RSpec.describe TypedParameters::Rule do
  subject(:rule) { described_class.new(["data"], Hash) }

  describe "#decompose" do
    subject { rule.decompose }

    context "when the rule's condition is decomposable" do
      # NOTE: decomposable types must implement #typed_json_attributes
      class DataHash
        def self.typed_json_attributes
          { data: Hash }
        end
      end

      let(:rule) { described_class.new(["data"], DataHash) }
      let(:decomposed_rule) { described_class.new(["data"], { data: Hash }) }

      it { is_expected.to eq decomposed_rule }
    end

    context "when the rule's condition is not decomposable" do
      it { is_expected.to eq rule }
    end
  end

  describe "#enforce" do
    subject { rule.enforce(paramter) }

    context "when the attribute adheres to the rule's condition" do
      let(:paramter) { {} }

      it { is_expected.to eq true }
    end

    context "when the attribute does not adhere to the rule's condition" do
      let(:paramter) { [] }

      it { is_expected.to eq false }
    end
  end
end
