# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

def create_customer(num=1)
  customers = []
  num.times do |i|
    customers << Customer.create(first_name: "First#{i}", last_name: "Last#{i}")
  end
  customers
end

def create_transaction(num=1)
  transactions = []
  num.times do |i|
    result = ["success", "failed"]
    merchant = create_merchant(1)
    customer = create_customer(1)
    invoice = create_invoice(1)
    transactions << Transaction.create(invoice_id: invoice.first.id, credit_card_number: "465440541824#{rand(1000)}", result: "#{result.sample}")
  end
  transactions
end

def create_invoice(num=1)
  invoices = []
  num.times do |i|
    merchant = create_merchant(1)
    customer = create_customer(1)
    invoices << Invoice.create(customer_id: customer.first.id, merchant_id: merchant.first.id, status: "shipped")
  end
  invoices
end

def create_merchant(num=1)
  merchants = []
  num.times do |i|
    merchants << Merchant.create(name: "Merchant_Name_#{i}")
  end
 merchants
end

def create_item(num=1)
  items = []
  price = rand(100).to_f
  num.times do |i|
    merchant = create_merchant(1)
    items << Item.create(name: "Item_Name_#{i}", description: "Item description for Item #{i}", unit_price: price, merchant_id: merchant.first.id)
  end
  items
end

def create_invoice_item(num=1)
  invoice_items = []
  quantity = rand(10)
  price = rand(100).to_f
  num.times do |i|
    item = create_item(1).first
    invoice = create_invoice(1).first
    invoice_items << InvoiceItem.create(item_id: item.id, invoice_id: invoice.id, quantity: quantity, unit_price: price)
  end
  invoice_items
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end


  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end


  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end


  config.before(:each) do
    DatabaseCleaner.start
  end


  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include FactoryGirl::Syntax::Methods
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
