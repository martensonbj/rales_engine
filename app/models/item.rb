class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def get_revenue(date)
    invoices.successful(date).reduce(0) do |acc, invoice|
      acc + invoice.get_revenue_for_item(self)
    end
  end

end
