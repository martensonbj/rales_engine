class Api::V1::InvoiceItems::FindAllController < ApplicationController
  respond_to :json

  def index
    name = params.first[0]
    value = params.first[1]
    if name == 'status'
      respond_with InvoiceItem.where("#{name} ILIKE ?", value)
    else
      respond_with InvoiceItem.where("#{name} = ?", value)
    end
  end

end
