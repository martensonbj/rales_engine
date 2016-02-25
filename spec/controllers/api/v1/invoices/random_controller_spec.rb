require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do
  describe "GET show" do
    it "shows a random invoice" do
      invoices = create_invoice(5)
      get :show, format: :json

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:status].class).to eq(String)
    end
  end

end
