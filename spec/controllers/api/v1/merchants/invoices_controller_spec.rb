require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  describe "GET index" do
    it "shows all invoices" do
      customer = create_customer
      merchant = create_merchant
      5.times do |i|
        Invoice.create(customer_id: customer.first.id, merchant_id: merchant.first.id, status: "shipped")
      end

      get :index, format: :json, id: merchant.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.first[:status]).to eq("shipped")
      expect(json_response.last[:status]).to eq("shipped")
      expect(json_response.count).to eq(5)
    end
  end
end
