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
