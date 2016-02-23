class Api::V1::Merchants::FindAllController < ApplicationController
  respond_to :json

  def index
    name = params.first[0]
    value = params.first[1]
    if name == 'name'
      respond_with Merchant.where("#{name} ILIKE ?", value)
    else
      respond_with Merchant.where("#{name} = ?", value)
    end
  end

end
