require 'rails_helper'

RSpec.describe Api::V1::Merchants::FindController, type: :controller do
  describe "GET show" do
    it "find asingle merchant" do
      merchants = create_merchant(2)
      get :show, format: :json, name: "Merchant_Name_0", id: merchants.first.id

      merchant = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchant[:name]).to eq "Merchant_Name_0"
    end
  end

end
