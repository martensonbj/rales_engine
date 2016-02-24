require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "is invalid without a name" do
    merchant = Merchant.new
    expect(merchant).to be_invalid
  end
end
