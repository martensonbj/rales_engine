# GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across all transactions

class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:id])
    revenue = merchant.invoices.successful.reduce(0) do |sum, invoice|
      sum + get_revenue(invoice)
    end.round(2)

    respond_with({"revenue" => "#{revenue}"})
  end #show

  def get_revenue(invoice)
    invoice.invoice_items.reduce(0) do |sum, item|
      sum + item.unit_price * item.quantity
    end
  end

end


# Find all invoices with given merchant id
