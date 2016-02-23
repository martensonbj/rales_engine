class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json

  def show
    offset = rand(InvoiceItem.count)
    respond_with InvoiceItem.offset(offset).first
  end

end
