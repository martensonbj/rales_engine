class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:id])
    invoices = merchant.invoices.is_successful
    ranked_invoices = invoices.select('customer_id, count(customer_id) as frequency').
                      order('frequency desc').
                      group('customer_id')
    respond_with ranked_invoices.first.customer
  end

end
