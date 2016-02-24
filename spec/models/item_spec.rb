require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is invalid without a name" do
    item = Item.new(description: "Nihil autem sit odio inventore deleniti. Est lauda...", unit_price: 100.10, merchant_id: 1)
    expect(item).to be_invalid
  end
  it "is invalid without a description" do
    item = Item.new(name: "Item Qui Esse", unit_price: 100.10, merchant_id: 1)
    expect(item).to be_invalid
  end
  it "is invalid without a unit price" do
    item = Item.new(name: "Item Qui Esse", description: "Nihil autem sit odio inventore deleniti. Est lauda...", merchant_id: 1)
    expect(item).to be_invalid
  end
  it "is invalid without a merchant id" do
    item= Item.new(name: "Item Qui Esse", description: "Nihil autem sit odio inventore deleniti. Est lauda...", unit_price: 100.10)
    expect(item).to be_invalid
  end
end
