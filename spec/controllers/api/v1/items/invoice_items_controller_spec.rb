require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do
  describe "GET index" do
    it "shows the associated invoice items per item" do
      item = create_item.first
      invoice_items = create_invoice_item(10)

      invoice_items.map {|invoice_item| invoice_item.update_attributes(item_id: item.id)}

      get :index, format: :json, id: item.id

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response.first[:item_id]).to eq(item.id)
      expect(json_response.count).to eq 10
    end
  end

end
