class Api::V1::Customers::FindAllController < ApplicationController
  respond_to :json

  def index
    name = params.first[0]
    value = params.first[1]
    if name == 'first_name' || name == 'last_name'
      respond_with Customer.where("#{name} ILIKE ?", value)
    else
      respond_with Customer.where("#{name} = ?", value)
    end
  end

end
