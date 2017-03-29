require 'spec_helper'

RSpec.describe TypedParams::RequestBody do
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

  describe "#find" do
    subject { request_body.find(path) }

    let(:path) { %w(data attributes) }
    let(:paramter) do
      TypedParams::Parameter.new(path, parameters['data']['attributes'])
    end

    context "when there a rule at the given path" do
      context "when the path argument mixes symbols and strings" do
        let(:path) { [ :data, "attributes" ] }

        it { is_expected.to eq paramter }
      end

      context "when there is no rule at the given path" do
        let(:path) { %w(foo bar) }

        it { is_expected.to eq nil }
      end
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
