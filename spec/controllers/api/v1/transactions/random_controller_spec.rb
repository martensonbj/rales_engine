require 'rails_helper'

RSpec.describe Api::V1::Transactions::RandomController, type: :controller do
  describe "GET show" do
    it "shows a random transaction" do
      transactions = create_transaction(2)
      get :show, format: :json

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:result].class).to eq(String)
    end
  end

end
