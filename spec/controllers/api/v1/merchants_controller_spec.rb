require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  describe "GET index" do
    it "shows all items" do
      merchants = create_merchant(2)
      get :index, format: :json

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchants.first[:name]).to eq("Merchant_Name_0")
      expect(merchants.last[:name]).to eq("Merchant_Name_1")
      expect(merchants.count).to eq 2
    end
  end

  describe "GET show" do
    it "shows a single items" do
      merchants = create_merchant(2)
      merchant = merchants.first
      get :show, format: :json, id: merchant.id

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchant[:name]).to eq("Merchant_Name_0")
      expect(merchants.count).to eq 4
    end
  end

end
