require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindAllController, type: :controller do
  describe "GET index" do
    it "finds all transactions" do
      transactions = create_transaction(10)
      get :index, format: :json, result: "success"

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.first[:result].class).to eq(String)
    end
  end

end
