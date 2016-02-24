require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  describe "GET index" do
    it "shows all invoices" do
      create_invoice(3)
      get :index, format: :json

      invoices = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(invoices.first[:status]).to eq("shipped")
      expect(invoices.last[:status]).to eq("shipped")
      expect(invoices.count).to eq 3
    end

    describe "GET show" do
      it "shows a single invoice" do
        invoices = create_invoice(3)
        invoice = invoices.last
        get :show, format: :json, id: invoice.id

        invoice = JSON.parse(response.body, symbolize_names: true)

        assert_response :success
        expect(invoice[:status]).to eq("shipped")
        expect(invoices.count).to eq 3
      end
    end

  end
end
