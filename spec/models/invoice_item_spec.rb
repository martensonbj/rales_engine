require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it "is invalid without a quantity" do
    invoice_item = InvoiceItem.new(item_id: 539, invoice_id: 1, unit_price: 100.10)
    expect(invoice_item).to be_invalid
  end

  it "is invalid without a unit price" do
    invoice_item = InvoiceItem.new(item_id: 539, invoice_id: 1, quantity: 5)
    expect(invoice_item).to be_invalid
  end
end
