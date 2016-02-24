class Api::V1::Merchants::RevenueController < ApplicationController
respond_to :json

  # def index
  #   revenue = Merchant.all.reduce(0) do |acc, merchant|
  #     acc + merchant.get_revenue(params[:date])
  #   end
  #   respond_with ({"total_revenue" => "#{revenue}"})
  # end

  def index
    merchants = Merchant.all
    date = params[:date]
    revenue = merchants.reduce(0) do |sum, merchant|
      invoices = merchant.invoices.where(created_at: date)
      total_revenue = invoices.is_successful.joins(:invoice_items).sum("unit_price * quantity")
      sum + total_revenue
    end
    respond_with({"total_revenue" => "#{revenue}"})
  end

  def show
    merchant = Merchant.find(params[:id])
    if params[:date]
      date = params[:date]
      invoices = merchant.invoices.where(created_at: date)
      total_revenue = invoices.is_successful.joins(:invoice_items).sum("unit_price * quantity")
      respond_with({revenue: total_revenue})
    else
      total_revenue = merchant.invoices.is_successful.joins(:invoice_items).sum("unit_price * quantity")
      respond_with({revenue: total_revenue})
    end
  end

end
