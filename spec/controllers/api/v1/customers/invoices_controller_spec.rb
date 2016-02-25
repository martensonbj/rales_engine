require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do
  describe "GET index" do
    it "shows collection of associated invoices" do
      customer = create_customer.first
      invoices = create_invoice(10)
      invoices.map {|i| i.update_attributes(customer_id: customer.id)}

      get :index, format: :json, id: customer.id

      json_response = JSON.parse(response.body, symbolize_names: true)
      
      assert_response :success
      expect(json_response.count).to eq(10)
    end
  end

end
