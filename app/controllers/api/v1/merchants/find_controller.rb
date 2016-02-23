class Api::V1::Merchants::FindController < ApplicationController
  respond_to :json

  def show
    name = params.first[0]
    value = params.first[1]
    if name == 'name'
      respond_with Merchant.find_by("#{name} ILIKE ?", value)
    else
      respond_with Merchant.find_by("#{name} = ?", value)
    end
  end

end
