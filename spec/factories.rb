# FactoryGirl.define do
#
#   factory :item do
#     name
#     description
#     unit_price
#     # association :merchant, factory: :merchant
#   end
#
#   sequence :unit_price do |n|
#     10 + n
#   end
#
#   sequence :name do |n|
#     "name#{n}"
#   end
#
#   sequence :description do |n|
#     "This is the description for item name#{n}"
#   end

  # factory :merchant do
  #   name { generate(:merchant_name) }
  #
  #   factory :merchant_with_customer do
  #     transient do
  #       customer_count 1
  #       item_count 2
  #     end
  #
  #     after(:create) do |merchant, evaluator|
  #       create_list(:user_merchant, evaluator.user_count, merchant: vendor)
  #       create_list(:item, evaluator.item_count, merchant: merchant)
  #     end
  #   end
  #
  #   factory :merchant_with_customer_and_invoice do
  #     transient do
  #       customer_count 1
  #       item_count 2
  #       invoice_count 2
  #     end
  #
  #     after(:create) do |merchant, evaluator|
  #       create_list(:user_merchant, evaluator.customer_count, merchant: merchant)
  #       create_list(:invoice_item, evaluator.invoice_count, merchant: merchant)
  #     end
  #   end
  #
  #   factory :merchant_with_items do
  #     transient do
  #       item_count 2
  #     end
  #
  #     after(:create) do |merchant, evaluator|
  #       create_list(:item, evaluator.item_count, merchant: merchant)
  #     end
  #   end
  # end

  # factory :invoice_item do
  #   item nil
  #   invoice nil
  #   quantity 1
  #   unit_price 1
  # end
  # factory :transaction do
  #   invoice nil
  #   credit_card_number 1
  #   credit_card_expiration_date "2016-02-22 14:39:14"
  #   result "MyString"
  # end
  # factory :invoice do
  #   customer nil
  #   merchant nil
  #   status "MyString"
  # end
  # factory :item do
  #   name "My First Item"
  #   description "My first item description"
  #   unit_price 1
  #   merchant rand(Merchant.count)
  # end
  # factory :customer do
  #   first_name "MyString"
  #   last_name "MyString"
  # end
  # factory :merchant do
  #   name "MyString"
  # end
