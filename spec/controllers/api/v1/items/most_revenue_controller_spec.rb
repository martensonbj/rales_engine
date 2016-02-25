require 'rails_helper'

RSpec.describe Api::V1::Items::MostRevenueController, type: :controller do
  describe "GET show" do
    it "shows most revenue for item" do
      assert_response :success
    end
  end

end
