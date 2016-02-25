require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  describe "GET show" do
    it "shows the associated item per invoice_item" do
      invoice_item = create_invoice_item
      item = invoice_item.first.item
      get :show, format: :json, id: invoice_item.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:name]).to eq("Item_Name_0")
    end
  end

end
