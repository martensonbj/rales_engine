require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  describe "GET index" do
    it "shows all invoice items per invoice" do
      invoice = create_invoice
      item = create_item
      invoice_items = 5.times do |i|
        InvoiceItem.create(item_id: item.first.id, invoice_id: invoice.first.id, quantity: rand(5), unit_price: 100.10)
      end

      get :index, format: :json, id: invoice.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.first[:unit_price]).to eq("100.1")
      expect(json_response.last[:quantity].class).to eq(Fixnum)
      expect(json_response.count).to eq 5
    end
  end

end
