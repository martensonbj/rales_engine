class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
<<<<<<< Updated upstream
=======

  validates :name, presence: true

  def get_revenue(date)
    invoices.successful(date).reduce(0) do |acc, invoice|
      acc + invoice.get_revenue
    end.round(2)
  end

>>>>>>> Stashed changes
end
