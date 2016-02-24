require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET index" do
    it "shows all items" do
      merchant = Merchant.create(name: "Merchant1")
      item1 = Item.create(name: "Item1", description: "Item description 1", merchant_id: merchant.id, unit_price: 100.10)
      item2 = Item.create(name: "Item2", description: "Item description 2", merchant_id: merchant.id, unit_price: 100.10)
      get :index, format: :json

      items = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(items.first[:name]).to eq("Item1")
      expect(items.first[:description]).to eq("Item description 1")
      expect(items.last[:name]).to eq("Item2")
      expect(items.last[:description]).to eq("Item description 2")
      expect(items.count).to eq 2
    end

    describe "GET show" do
      it "shows a single items" do
        merchant = Merchant.create(name: "Merchant1")
        item1 = Item.create(name: "Item1", description: "Item description 1", merchant_id: merchant.id, unit_price: 100.10)
        item2 = Item.create(name: "Item2", description: "Item description 2", merchant_id: merchant.id, unit_price: 100.10)
        item = Item.all.last

        get :show, format: :json, id: item.id

        items = JSON.parse(response.body, symbolize_names: true)

        assert_response :success
        expect(item[:name]).to eq("Item2")
        expect(item[:description]).to eq("Item description 2")
        expect(items.count).to eq 7
      end
    end

  end
end
