class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json

  def show
    offset = rand(Transaction.count)
    respond_with Transaction.offset(offset).first
  end

end
