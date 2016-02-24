class Api::V1::Items::MostRevenueController < ApplicationController
  respond_to :json

  def index
    quantity = params[:quantity].to_i
    result =  Invoice.is_successful
              .joins(:invoice_items)
              .limit(params[:quantity])
              .order("sum(unit_price * quantity) desc")
              .group(:item_id)
              .sum("unit_price * quantity")
              .to_a
              .map {|id, revenue| {"id" => id, "name" => Item.find(id).name}}

    respond_with result
  end

end
