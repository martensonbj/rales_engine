require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  describe "GET index" do
    it "shows collection of associated transactions" do
      customer = create_customer.first
      transactions = create_transaction(10)
      transactions.map {|t| t.invoice.update_attributes(customer_id: customer.id)}

      get :index, format: :json, id: customer.id
      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response.count).to eq(10)
    end
  end

end
