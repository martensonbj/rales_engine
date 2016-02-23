Rails.application.routes.draw do
  namespace :api do

    namespace :v1 do

      resources :merchants, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'merchants/find#show'
          get 'find_all', to: 'merchants/find_all#index'
          get 'random', to: 'merchants/random#show'
        end
      end

      resources :customers, only: [:index, :show], defaults: {format: :json}do
        collection do
          get 'find', to: 'customers/find#show'
          get 'random', to: 'customers/random#show'
          get 'find_all', to: 'customers/find_all#index'

        end
      end

      resources :items, only: [:index, :show], defaults: {format: :json}do
        collection do
          get 'find', to: 'items/find#show'
          get 'random', to: 'items/random#show'
          get 'find_all', to: 'items/find_all#index'
        end
      end

      resources :invoices, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'invoices/find#show'
          get 'random', to: 'invoices/random#show'
          get 'find_all', to: 'invoices/find_all#index'

        end
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'invoice_items/find#show'
          get 'random', to: 'invoice_items/random#show'
          get 'find_all', to: 'invoice_items/find_all#index'
        end
      end

      resources :transactions, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to:'transactions/find#show'
          get 'random', to:'transactions/random#show'
          get 'find_all', to: 'transactions/find_all#index'
        end
      end


    end #v1
  end #api
end
