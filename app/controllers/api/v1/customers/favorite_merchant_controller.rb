class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    customer = Customer.find(params[:id])
    invoices = customer.invoices.is_successful
    ranked_invoices = invoices.select('merchant_id, count(merchant_id) as frequency').
                      order('frequency desc').
                      group('merchant_id')
    respond_with ranked_invoices.first.merchant
  end

end
