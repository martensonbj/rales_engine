require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  describe "GET index" do
    it "shows all transactions per invoice" do
      invoice = create_invoice
      transactions = 5.times do |i|
        Transaction.create(invoice_id: invoice.first.id, credit_card_number: "465440541824100#{i}", result: "success")
      end

      get :index, format: :json, id: invoice.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.first[:result]).to eq("success")
      expect(json_response.first[:credit_card_number]).to eq("4654405418241000")
      expect(json_response.last[:credit_card_number]).to eq("4654405418241004")
      expect(json_response.count).to eq 5
    end
  end

end
