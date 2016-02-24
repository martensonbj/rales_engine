require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  describe "GET index" do
    it "shows all items" do
      merchant = Merchant.create(name: "Merchant1")
      merchant = Merchant.create(name: "Merchant2")
      get :index, format: :json

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchants.first[:name]).to eq("Merchant1")
      expect(merchants.last[:name]).to eq("Merchant2")
      expect(merchants.count).to eq 2
    end
  end

  describe "GET show" do
    it "shows a single items" do
      merchant1 = Merchant.create(name: "Merchant1")
      merchant2 = Merchant.create(name: "Merchant2")
      merchant = Merchant.all.first
      get :show, format: :json, id: merchant.id

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchant[:name]).to eq("Merchant1")
      expect(merchants.count).to eq 4
    end
  end

end
