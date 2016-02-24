require 'rails_helper'

RSpec.describe Api::V1::Merchants::MostRevenueController, type: :controller do
  describe "GET index" do
    it "displays top merchants by revenue" do
      merchants = create_merchant(5)
      get :index, format: :json, quantity: "3"

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchants.count).to eq 3
    end
  end

end
