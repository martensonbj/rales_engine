FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity 1
    unit_price 1
  end
  factory :transaction do
    invoice nil
    credit_card_number 1
    credit_card_expiration_date "2016-02-22 14:39:14"
    result "MyString"
  end
  factory :invoice do
    customer nil
    merchant nil
    status "MyString"
  end
  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant nil
  end
  factory :customer do
    first_name "MyString"
    last_name "MyString"
  end
  factory :merchant do
    name "MyString"
  end
end