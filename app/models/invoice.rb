class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :items, through: :invoice_items
  has_many :transactions
  has_many :invoice_items
<<<<<<< Updated upstream
=======

  validates :status, presence: true

  def self.successful(date = nil)
    successful = joins(:transactions).where(transactions: {result: "success"})
      if date
        successful = successful.where(created_at: date)
      end
    successful
  end

  def get_revenue
    invoice_items.reduce(0) do |acc, item|
      acc + item.unit_price.to_f * item.quantity
    end
  end

  def get_revenue_for_item(item)
    invoice_items.reduce(0) do |acc, item|
      acc + item.unit_price.to_f * item.quantity
    end
  end
>>>>>>> Stashed changes
end
