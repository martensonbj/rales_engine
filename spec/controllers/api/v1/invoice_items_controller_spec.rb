require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  describe "GET index" do
    it "shows all invoice_items" do
      invoice_items = create_invoice_item(3)
      get :index, format: :json

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(invoice_items.first[:quantity].class).to eq(Fixnum)
      expect(invoice_items.last[:id]).to_not eq(invoice_items.first[:id])
      expect(invoice_items.count).to eq 3
    end

    describe "GET show" do
      it "shows a single invoice" do
        invoice_items = create_invoice_item(3)
        invoice_item = invoice_items.first

        get :show, format: :json, id: invoice_item.id

        invoice_item = JSON.parse(response.body, symbolize_names: true)

        assert_response :success
        expect(invoice_item[:quantity].class).to eq(Fixnum)
        expect(invoice_items.count).to eq 3
      end
    end

  end
end
