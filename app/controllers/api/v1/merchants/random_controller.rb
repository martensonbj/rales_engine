class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json

  def show
    # respond_with Merchant.all.sample
    offset = rand(Merchant.count)
    respond_with Merchant.offset(offset).first
  end

end
