require 'rails_helper'

RSpec.describe Api::V1::Merchants::RevenueController, type: :controller do
  describe "GET index" do
    it "displays merchants by revenue" do
      merchants = create_merchant(5)
      get :index, format: :json, id: merchants.first.id

      merchants = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchants.count).to eq 1
    end
  end

end
