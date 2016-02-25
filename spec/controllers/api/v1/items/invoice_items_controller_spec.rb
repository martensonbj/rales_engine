require 'rails_helper'

RSpec.describe Api::V1::Items::ItemsController, type: :controller do
  describe "GET index" do
    it "shows the associated item per invoice_item" do
      item = create_item.first
      invoice_items = create_invoice_item(10)

      invoice_items.map {|invoice_item| invoice_item.update_attributes(item_id: item.id)}

      get :index, format: :json, id: item.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.first[:name]).to eq("Item_Name_0")
      expect(json_response.count).to eq 11
    end
  end

end
