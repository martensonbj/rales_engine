class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json

  def show
    offset = rand(Customer.count)
    respond_with Customer.offset(offset).first
  end

end
