require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "is invalid without a status" do
    invoice = Invoice.new(customer_id: 1, merchant_id: 1)
    invoice.should_not be_valid
  end
end
