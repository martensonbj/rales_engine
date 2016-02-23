class Api::V1::Invoices::FindAllController < ApplicationController
  respond_to :json

  def index
    name = params.first[0]
    value = params.first[1]
    if name == 'status'
      respond_with Invoice.where("#{name} ILIKE ?", value)
    else
      respond_with Invoice.where("#{name} = ?", value)
    end
  end

end
