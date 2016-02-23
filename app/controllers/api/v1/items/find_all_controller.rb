class Api::V1::Items::FindAllController < ApplicationController
  respond_to :json

  def index
    name = params.first[0]
    value = params.first[1]
    if name == 'name' || name == 'description'
      respond_with Item.where("#{name} ILIKE ?", value)
    else
      respond_with Item.where("#{name} = ?", value)
    end
  end

end
