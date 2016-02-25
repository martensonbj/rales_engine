require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do
  describe "GET index" do
    it "shows all items per invoice" do
      invoice = create_invoice
      get :index, format: :json, id: invoice.first.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
    end
  end

end
