require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::FindAllController, type: :controller do
  describe "GET index" do
    it "finds all invoice items" do
      invoice_items = create_invoice_item(10)
      get :index, format: :json, quantity: invoice_items.first.quantity
      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.count).to eq 10
    end
  end

end
