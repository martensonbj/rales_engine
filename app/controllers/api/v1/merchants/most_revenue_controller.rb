class Api::V1::Merchants::MostRevenueController < ApplicationController
  respond_to :json

  def index
    merchants = Merchant.all.map do |merchant|
      {'id' => merchant.id, 'name' => merchant.name, 'revenue' => merchant.get_revenue(params[:date])}
    end

    merchants.sort_by! do |merchant|
      - merchant['revenue']
    end

    respond_with merchants[0..(params[:quantity].to_i - 1)]
  end
end

# revenue = merchants.reduce(0) do |sum, merchant|
#   invoices = merchant.invoices.where(created_at: date)
#   total_revenue = invoices.is_successful.joins(:invoice_items).sum("unit_price * quantity")
#   sum + total_revenue
# end
