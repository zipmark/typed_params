class BankAccount
end

CreateBankAccountParams = {
  data: {
    type: 'bank-account',
    attributes: {
      account_number: String,
      details: ComplexObject,
    }
  }
}
