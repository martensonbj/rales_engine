require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "is invalid without a result" do
    transaction = Transaction.new(invoice_id: 1, credit_card_number: "4654405418249632")
    transaction.should_not be_valid
  end

  it "is invalid without a credit_card_number" do
    transaction = Transaction.new(invoice_id: 1, result: "success")
    transaction.should_not be_valid
  end
end
