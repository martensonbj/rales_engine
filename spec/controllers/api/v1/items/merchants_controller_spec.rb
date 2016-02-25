require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  describe "GET show" do
    it "shows the associated merchant per item" do
      item = create_item.first

      get :show, format: :json, id: item.id

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:name]).to eq("Merchant_Name_0")
    end
  end

end
