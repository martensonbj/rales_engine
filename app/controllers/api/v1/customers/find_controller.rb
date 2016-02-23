class Api::V1::Customers::FindController < ApplicationController
  respond_to :json

  def show
    name = params.first[0]
    value = params.first[1]
    if name == 'first_name' || name == 'last_name'
      respond_with Customer.find_by("#{name} ILIKE ?", value)
    else
      respond_with Customer.find_by("#{name} = ?", value)
    end
  end

end
