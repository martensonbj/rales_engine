class Api::V1::Transactions::FindAllController < ApplicationController
  respond_to :json

  def index
    name = params.first[0]
    value = params.first[1]
    if name == 'credit_card_number' || name == "result" || name == "credit_card_expiration_date"
      respond_with Transaction.where("#{name} ILIKE ?", value)
    else
      respond_with Transaction.where("#{name} = ?", value)
    end
  end

end
