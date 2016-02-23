class ChangeCreditCardExpiratonDateInTransactions < ActiveRecord::Migration
  def change
    change_column :transactions, :credit_card_expiration_date, :string
  end
end
