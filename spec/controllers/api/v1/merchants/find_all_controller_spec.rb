require 'rails_helper'

RSpec.describe Api::V1::Merchants::FindAllController, type: :controller do
  describe "GET index" do
    it "finds all merchants" do
      merchants = create_merchant(2)
      get :index, format: :json, name: "Merchant_Name_0"

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchants.count).to eq 1
    end
  end

end
