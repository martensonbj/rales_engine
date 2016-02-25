require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, type: :controller do
  describe "GET show" do
    it "shows a random customer" do
      customers = create_customer(5)
      get :show, format: :json

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:first_name].class).to eq(String)
    end
  end

end
