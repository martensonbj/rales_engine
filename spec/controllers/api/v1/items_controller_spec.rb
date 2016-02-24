require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET index" do
    it "shows all items" do
      items = create_item(2)
      get :index, format: :json

      items = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(items.first[:name]).to eq("Item_Name_0")
      expect(items.first[:description]).to eq("Item description for Item 0")
      expect(items.last[:name]).to eq("Item_Name_1")
      expect(items.last[:description]).to eq("Item description for Item 1")
      expect(items.count).to eq 2
    end

    describe "GET show" do
      it "shows a single items" do
        items = create_item(2)
        item = items.last

        get :show, format: :json, id: item.id

        items = JSON.parse(response.body, symbolize_names: true)

        assert_response :success
        expect(item[:name]).to eq("Item_Name_1")
        expect(item[:description]).to eq("Item description for Item 1")
        expect(items.count).to eq 7
      end
    end

  end
end
