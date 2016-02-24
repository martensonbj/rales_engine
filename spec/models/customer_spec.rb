require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is invalid without a first name" do
    customer = Customer.new(last_name: "Ondricka")
    expect(customer).to be_invalid
  end

  it "is invalid without a last name" do
    customer = Customer.new(first_name: "Joey")
    expect(customer).to be_invalid
  end
end
