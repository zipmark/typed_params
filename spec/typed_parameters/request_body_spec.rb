require 'spec_helper'

RSpec.describe TypedParameters::RequestBody do
  let(:parameters) do
    {
      'data' => {
        'type' => "users",
        'attributes' => {
          'name'  => "Matt",
          'email' => "matt@zipmark.com"
        }
      }
    }
  end

  subject(:request_body) { described_class.new(parameters) }

  describe "#parameter_at" do
    let(:path) { %w(data attributes) }
    subject { request_body.parameter_at(path) }

    context "when the path argument mixes symbols and strings" do
      let(:path) { [ :data, "attributes" ] }

      it { is_expected.to eq parameters["data"]["attributes"] }
    end

    it "finds the value at the given keys" do
      expect(subject).to eq parameters["data"]["attributes"]
    end
  end

  describe "#paths" do
    subject { request_body.paths }

    let(:paths) do
      [
        %w(data),
        %w(data type),
        %w(data attributes),
        %w(data attributes name),
        %w(data attributes email)
      ]
    end

    it "returns a list of all paths traversing the request body" do
      expect(subject).to eq paths
    end
  end
end
