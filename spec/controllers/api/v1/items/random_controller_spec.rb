require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, type: :controller do
  describe "GET show" do
    it "shows a random item" do
      items = create_item(5)
      get :show, format: :json

      json_response = JSON.parse(response.body, symbolize_names: true)
      assert_response :success
      expect(json_response[:name].class).to eq(String)
    end
  end

end
