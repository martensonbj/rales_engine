require 'rails_helper'

RSpec.describe Api::V1::Customers::FindAllController, type: :controller do
  describe "GET index" do
    it "finds all customers" do
      customer = create_customer(2)
      get :index, format: :json, first_name: "First0"
      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response.count).to eq 1
    end
  end

end
