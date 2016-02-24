# GET /api/v1/merchants/most_revenue?quantity=x
# returns the top x merchants ranked by total revenue

class Api::V1::Merchants::MostRevenueController < ApplicationController
  respond_to :json

  def index
    quantity = params.first[1]

  end

end
