require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  describe "GET show" do
    it "shows the associated customer per invoice" do
      invoice = create_invoice
      customer = invoice.first.customer

      get :show, format: :json, id: invoice.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:first_name]).to eq("First0")
      expect(json_response[:last_name]).to eq("Last0")
      expect(json_response.count).to eq 5
    end
  end

end
