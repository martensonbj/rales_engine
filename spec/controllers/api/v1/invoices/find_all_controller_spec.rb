require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindAllController, type: :controller do
  describe "GET index" do
    it "finds all invoices" do
      invoices = create_invoice(10)
      get :index, format: :json, status: "shipped"
      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.count).to eq 10
    end
  end

end
