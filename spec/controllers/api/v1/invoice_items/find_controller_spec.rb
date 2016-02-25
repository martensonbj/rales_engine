require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::FindController, type: :controller do
  describe "GET show" do
    it "find a single invoice item by id" do
      invoice_items = create_invoice_item(10)
      get :show, format: :json, id: invoice_items.first.id, id: invoice_items.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.count).to eq 7
    end
  end

end
