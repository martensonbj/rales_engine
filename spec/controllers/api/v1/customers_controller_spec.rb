require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe "GET index" do
    it "shows all merchants" do
      create_customer(2)
      get :index, format: :json

      customers = JSON.parse(response.body, symbolize_names: true)

      assert_response :success
      expect(customers.first[:first_name]).to eq("First0")
      expect(customers.first[:last_name]).to eq("Last0")
      expect(customers.last[:first_name]).to eq("First1")
      expect(customers.last[:last_name]).to eq("Last1")
      expect(customers.count).to eq 2
    end

    describe "GET show" do
      it "shows a single items" do
        customer1 = Customer.create(first_name: "Deandre", last_name: "Jordan")
        customer2 = Customer.create(first_name: "Blake", last_name: "Griffin")
        customer = Customer.all.last
        get :show, format: :json, id: customer.id

        customers = JSON.parse(response.body, symbolize_names: true)

        assert_response :success
        expect(customer[:first_name]).to eq("Blake")
        expect(customer[:last_name]).to eq("Griffin")
        expect(customers.count).to eq 5
      end
    end

  end
end
