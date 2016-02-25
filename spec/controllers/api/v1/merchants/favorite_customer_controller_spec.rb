require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomerController, type: :controller do
  describe "GET show" do
    it "shows favorite customer for merchant" do
      assert_response :success
    end
  end

end
