require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  describe "GET index" do
    it "shows all transactions" do
      create_transaction(2)
      get :index, format: :json

      transactions = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(transactions.first[:result].class).to eq(String)
      expect(transactions.count).to eq 2
    end

    describe "GET show" do
      it "shows a single transaction" do
        transactions = create_transaction(2)
        get :show, format: :json, id: transactions.first.id

        transaction = JSON.parse(response.body, symbolize_results: true)
        assert_response :success
        expect(transaction["result"].class).to eq(String)
        expect(transaction.count).to eq 6
      end
    end

  end
end
