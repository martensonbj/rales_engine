require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "is invalid without a name" do
    merchant = Invoice.new
    merchant.should_not be_valid
  end
end
