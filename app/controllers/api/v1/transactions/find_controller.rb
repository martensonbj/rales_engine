class Api::V1::Transactions::FindController < ApplicationController
  respond_to :json

  def show
    name = params.first[0]
    value = params.first[1]
    if name == 'credit_card_number' || name == "result" || name == "credit_card_expiration_date"
      respond_with Merchant.find_by("#{name} ILIKE ?", value)
    else
      respond_with Merchant.find_by("#{name} = ?", value)
    end
  end

end
