require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindController, type: :controller do
  describe "GET show" do
    it "find a single invoice" do
      invoices = create_invoice(10)
      get :show, format: :json, id: invoices.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:status].class).to eq(String)
    end

    it "find a single invoice by status" do
      invoices = create_invoice(10)
      get :show, format: :json, status: "shipped"

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:status].class).to eq(String)
    end
  end



end
