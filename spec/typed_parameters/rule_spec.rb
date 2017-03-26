require 'spec_helper'

RSpec.describe TypedParameters::Rule do
  subject(:rule) { described_class.new(["data"], Hash) }

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
