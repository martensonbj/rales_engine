require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do
  describe "GET show" do
    it "shows the associated invoice per invoice_item" do
      invoice_item = create_invoice_item
      invoice = invoice_item.first.invoice
      get :show, format: :json, id: invoice_item.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:status]).to eq("shipped")
    end
  end

end
