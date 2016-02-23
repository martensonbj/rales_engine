class Api::V1::InvoiceItems::FindController < ApplicationController
  respond_to :json

  def show
    name = params.first[0]
    value = params.first[1]
    if name == 'status'
      respond_with InvoiceItem.find_by("#{name} ILIKE ?", value)
    else
      respond_with InvoiceItem.find_by("#{name} = ?", value)
    end
  end

end
