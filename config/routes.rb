Rails.application.routes.draw do
  namespace :api do

    namespace :v1 do

      resources :merchants, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'merchants/find#show'
          get 'find_all', to: 'merchants/find_all#index'
          get 'random', to: 'merchants/random#show'
        end
        member do
          get 'items', to: 'merchants/items#index'
          get 'invoices', to: 'merchants/invoices#index'
        end
      end

      resources :customers, only: [:index, :show], defaults: {format: :json}do
        collection do
          get 'find', to: 'customers/find#show'
          get 'random', to: 'customers/random#show'
          get 'find_all', to: 'customers/find_all#index'
        end
        member do
          get 'invoices', to: 'customers/invoices#index'
          get 'transactions', to: 'customers/transactions#index'
        end
      end

      resources :items, only: [:index, :show], defaults: {format: :json}do
        collection do
          get 'find', to: 'items/find#show'
          get 'random', to: 'items/random#show'
          get 'find_all', to: 'items/find_all#index'
        end
        member do
          get 'invoice_items', to: 'items/invoice_items#index'
          get 'merchant', to: 'items/merchants#show'
        end
      end

      resources :invoices, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'invoices/find#show'
          get 'random', to: 'invoices/random#show'
          get 'find_all', to: 'invoices/find_all#index'
        end
        member do
          get 'transactions', to: 'invoices/transactions#index'
          get 'invoice_items', to: 'invoices/invoice_items#index'
          get 'items', to: 'invoices/items#index'
          get 'customer', to: 'invoices/customers#show'
          get 'merchant', to: 'invoices/merchants#show'
        end
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'invoice_items/find#show'
          get 'random', to: 'invoice_items/random#show'
          get 'find_all', to: 'invoice_items/find_all#index'
        end
        member do
          get 'invoice', to: 'invoice_items/invoices#show'
          get 'item', to: 'invoice_items/items#show'
        end
      end

      resources :transactions, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to:'transactions/find#show'
          get 'random', to:'transactions/random#show'
          get 'find_all', to: 'transactions/find_all#index'
        end
        member do
          get 'invoice', to: 'transactions/invoices#show'
        end
      end


    end #v1
  end #api
end
