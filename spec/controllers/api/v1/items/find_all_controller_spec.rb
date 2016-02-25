require 'rails_helper'

RSpec.describe Api::V1::Items::FindAllController, type: :controller do
  describe "GET index" do
    it "finds all items" do
      items = create_item(10)
      get :index, format: :json, name: "Item_Name_0"
      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.count).to eq 1
    end
  end

end
