require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, type: :controller do
  describe "GET show" do
    it "shows a random item" do
      merchants = create_merchant(2)
      get :show, format: :json

      merchant = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(merchant[:name].class).to eq(String)
    end
  end

end
