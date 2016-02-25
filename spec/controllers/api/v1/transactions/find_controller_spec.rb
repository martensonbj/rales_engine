require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindController, type: :controller do
  describe "GET show" do
    it "find a single transaction" do
      transactions = create_transaction(10)
      get :show, format: :json, id: transactions.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:result].class).to eq(String)
    end
  end

end
