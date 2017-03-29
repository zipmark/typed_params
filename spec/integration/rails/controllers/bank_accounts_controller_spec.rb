require 'rails_helper'

RSpec.describe BankAccountsController, :type => :controller do
  describe "POST #create" do
    let(:params) do
      {
        data: {
          type: 'bank-account',
          attributes: {
            account_number: "1234",
            details: {
              foo: "foo",
              bar: "bar"
            }
          }
        }
      }
    end

    context "when the request body does not match the asserted format" do
      context "when an expected key is absent in the request body" do
        before { params.delete :data }

        pending
      end

      context "when a simple type is given instead of a complex type" do
        before { params[:data][:attributes][:details] = "4321" }

        pending
      end

      context "when the type param declares the wrong resource" do
        before { params[:data][:type] = 'credit-card' }

        pending
      end
    end

    context "when the request body matches the asserted format" do
      it "returns http success" do
        post :create, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
