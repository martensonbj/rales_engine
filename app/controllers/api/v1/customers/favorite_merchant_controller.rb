class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def index
    # customer 66 should be id 49, marvin renner bauch
    # select email, count(*) as c FROM orders GROUP BY email


    customer = Customer.find(params[:id])
    invoices = customer.invoices.joins(:transactions).where(transactions: {result: "success"})
    ranked_invoices = invoices.select('merchant_id, count(merchant_id) as frequency').
                      order('frequency desc').
                      group('merchant_id')
    id = ranked_invoices.first.merchant_id
    name = Merchant.find(id).name
    respond_with ({"id" => id, "name" => "#{name}"})
  end

end
