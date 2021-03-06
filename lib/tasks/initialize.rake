require 'csv'

namespace :initialize do
  desc "TODO"
    task seed_data: :environment do

      merchant_file = 'vendor/assets/data/merchants.csv'
      CSV.foreach(merchant_file, headers: true, header_converters: :symbol) do |row|
        Merchant.create! row.to_h
      end

      customer_file = 'vendor/assets/data/customers.csv'
      CSV.foreach(customer_file, :headers =>true, header_converters: :symbol) do |row|
        Customer.create! row.to_h
      end

      invoice_file = 'vendor/assets/data/invoices.csv'
      CSV.foreach(invoice_file, :headers =>true, header_converters: :symbol) do |row|
        Invoice.create! row.to_h
      end

      item_file = 'vendor/assets/data/items.csv'
      CSV.foreach(item_file, :headers =>true, header_converters: :symbol) do |row|
        Item.create! row.to_h
      end

      invoice_items_file = 'vendor/assets/data/invoice_items.csv'
      CSV.foreach(invoice_items_file, :headers =>true, header_converters: :symbol) do |row|
        InvoiceItem.create! row.to_h
      end

      transactions_file = 'vendor/assets/data/transactions.csv'
      CSV.foreach(transactions_file, :headers =>true, header_converters: :symbol) do |row|
        Transaction.create! row.to_h
      end

    end
end
