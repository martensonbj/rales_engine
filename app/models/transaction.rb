class Transaction < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :customer

  validates :credit_card_number, presence: true
  validates :result, presence: true
end
