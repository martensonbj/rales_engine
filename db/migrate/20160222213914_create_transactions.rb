class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :invoice, index: true, foreign_key: true
      t.integer :credit_card_number
      t.time :credit_card_expiration_date
      t.string :result

      t.timestamps null: false
    end
  end
end
