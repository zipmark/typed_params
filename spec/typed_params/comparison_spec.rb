require 'spec_helper'

RSpec.describe TypedParams::Comparison do
  subject(:comparison) do
    described_class.new(
      rules_format: rules_format,
      request_body: request_body
    )
  end

  let(:params)       { { name: name } }
  let(:rules_format) { TypedParams::RulesFormat.new(rules) }
  let(:request_body) { TypedParams::RequestBody.new(params) }

  describe "#errors" do
    subject { comparison.errors }

    context "when the rules format does not declare any optional types" do
      let(:rules) { { name: String } }

      context "when the request body conforms to the rules format" do
        let(:name) { "M@" }

        it { is_expected.to eq nil }
      end

      context "when the request body does not adhere to the rules format" do
        let(:name) { 1_000 }

        it "returns an object describing the invalid attribute" do
          expect(subject).to eq({ "name" => "param_must_be_string" })
        end
      end
    end

    context "when the rules format includes an optional type constraint" do
      # TODO: let(:rules) { { name: TypedParams.optional(String) } }
      let(:rules) { { name: [ String, NilClass ] } }

      context "when the request body does not adhere to the rules format" do
        let(:name) { 1_000 }

        it "returns an object describing the invalid attribute" do
          #expect(subject).to eq({ "name" => ["param_must_be_string"] })
          #expect(subject).to eq({ "name" => ["param_cannot_be_number"] })
        end
      end

      context "when the request body adheres to the rules format" do
        context "when the optional param's key is not present" do
          let(:params) { {} }

          pending "Must handle the missing key the same way as `name: nil`"
        end

        let(:name) { nil }

        #it { is_expected.to eq nil }
      end
    end
  end
end
