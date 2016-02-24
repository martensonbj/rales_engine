class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :unit_price, presence: true
  validates :quantity, presence: true
end
