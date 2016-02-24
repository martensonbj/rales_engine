class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  validates :name, presence: true

  def get_revenue(date)
    invoices.successful(date).get_invoice_revenue
  end

end
