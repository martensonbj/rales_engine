require 'rails_helper'

RSpec.describe Api::V1::Customers::FindController, type: :controller do
  describe "GET show" do
    it "finds a single customer by name" do
      customers = create_customer(10)
      get :show, format: :json, first_name: "First0", id: customers.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:first_name]).to eq "First0"
    end

    it "finds by id" do
      customers = create_customer(10)
      get :show, format: :json, id: customers.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(json_response[:id]).to eq customers.first.id
    end
  end

end
