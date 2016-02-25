require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  describe "GET index" do
    it "shows all items" do
      merchant = create_merchant
      items = 5.times do |i|
        Item.create(name: "Item_Name_#{i}", description: "Item description for Item #{i}", unit_price: 100.10, merchant_id: merchant.first.id)
      end

      get :index, format: :json, id: merchant.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.first[:name]).to eq("Item_Name_0")
      expect(json_response.last[:name]).to eq("Item_Name_4")
      expect(json_response.count).to eq 5
    end
  end

end
