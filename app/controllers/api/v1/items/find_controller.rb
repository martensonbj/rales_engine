class Api::V1::Items::FindController < ApplicationController
  respond_to :json

  def show
    name = params.first[0]
    value = params.first[1]
    if name == 'name' || name == 'description'
      respond_with Item.find_by("#{name} ILIKE ?", value)
    else
      respond_with Item.find_by("#{name} = ?", value)
    end
  end

end
