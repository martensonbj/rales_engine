class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json

  def show
    offset = rand(Invoice.count)
    respond_with Invoice.offset(offset).first
  end

end
