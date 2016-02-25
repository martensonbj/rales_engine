require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
  describe "GET show" do
    it "shows the associated invoices per transaction" do
      transaction = create_transaction.first

      get :show, format: :json, id: transaction.id

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:status]).to eq("shipped")
    end
  end

end
