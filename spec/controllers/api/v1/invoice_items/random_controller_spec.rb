require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::RandomController, type: :controller do
  describe "GET show" do
    it "shows a random invoice item" do
      invoice_items = create_invoice_item(5)
      get :show, format: :json

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:quantity].class).to eq(Fixnum)
    end
  end

end
