require 'rails_helper'

RSpec.describe Api::V1::Items::FindController, type: :controller do
  describe "GET show" do
    it "find a single item by id" do
      items = create_item(10)
      get :show, format: :json, id: items.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:name].class).to eq(String)
    end

    it "find a single item by id" do
      items = create_item(10)
      get :show, format: :json, name: "Item_Name_0"

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:name].class).to eq(String)
    end
  end

end
