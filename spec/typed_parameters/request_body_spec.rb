require 'typed_parameters/request_body'

RSpec.describe TypedParameters::RequestBody do
  let(:parameters) do
    {
      data: {
        type: "users",
        attributes: {
          name: "Matt",
          email: "matt@zipmark.com"
        }
      }
    }
  end

  subject(:request_body) { described_class.new(parameters) }

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
