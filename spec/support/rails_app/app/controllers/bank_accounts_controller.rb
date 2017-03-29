require 'bank_account'
require 'complex_object'

class BankAccountsController < ApplicationController
  include TypedParams::ActionController

  CreateBankAccountParams = {
    data: {
      type: 'bank-account',
      attributes: {
        account_number: String,
        details: ComplexObject,
      }
    }
  }

  assert_params_format CreateBankAccountParams, on: :create #do |request_body|
    # NOTE: do whatever you want with the param validation errors here.
    # e.g. request_body.errors.map { |error| CustomError.new(error) }
    # The result will be rendered as JSON.
  #end

  def create
    head :ok
  end
end
