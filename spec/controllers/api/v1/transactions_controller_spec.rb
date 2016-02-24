# require 'rails_helper'
#
# RSpec.describe Api::V1::TransactionsController, type: :controller do
#   describe "GET index" do
#     it "shows all transactions" do
#       customer =
#
#       get :index, format: :json
#
#       transactions = JSON.parse(response.body, symbolize_names: true)
#
#       assert_response :success
#       expect(transactions.first[:name]).to eq("Item1")
#       expect(transactions.first[:description]).to eq("Item description 1")
#       expect(transactions.last[:name]).to eq("Item2")
#       expect(transactions.last[:description]).to eq("Item description 2")
#       expect(transactions.count).to eq 2
#     end
#
#     describe "GET show" do
#       it "shows a single transaction" do
#
#         get :show, format: :json, id: item.id
#
#         transactions = JSON.parse(response.body, symbolize_names: true)
#
#         assert_response :success
#         expect(transaction[:name]).to eq("Item2")
#         expect(transaction[:description]).to eq("Item description 2")
#         expect(transactions.count).to eq 7
#       end
#     end
#
#   end
# end
