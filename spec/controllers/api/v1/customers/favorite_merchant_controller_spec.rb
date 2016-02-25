require 'rails_helper'

RSpec.describe Api::V1::Customers::FavoriteMerchantController, type: :controller do
  describe "GET show" do
    it "shows the customers favorite merchant" do

      assert_response :success
    end
  end

end
