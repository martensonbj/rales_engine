# require 'rails_helper'
#
# RSpec.describe Api::V1::Merchants::FavoriteCustomerController, type: :controller do
#   describe "GET show" do
#     it "shows favorite customer for merchant" do
#       merchant = create_merchant
#       customer = create_customer
#       binding.pry
#       get :show, format: :json, id: merchant.first.id
#
#       customer = JSON.parse(response.body, symbolize_names: true)
#
#       assert_response :success
#       expect(customer.count).to eq 1
#     end
#   end
#
# end
