require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  describe "GET show" do
    it "shows the associated merchant per invoice" do
      invoice = create_invoice
      merchant = invoice.first.merchant

      get :show, format: :json, id: invoice.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:name]).to eq("Merchant_Name_0")
    end
  end

end
