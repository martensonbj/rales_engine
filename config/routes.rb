Rails.application.routes.draw do
  namespace :api do

    namespace :v1 do

      resources :merchants, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'merchants/find#show'
        end
      end

      resources :customers, only: [:index, :show], defaults: {format: :json}do
        collection do
          get 'find', to: 'customers/find#show'
        end
      end

      resources :items, only: [:index, :show], defaults: {format: :json}do
        collection do
          get 'find', to: 'items/find#show'
        end
      end

      resources :invoices, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'invoices/find#show'
        end
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to: 'invoice_items/find#show'
        end
      end

      resources :transactions, only: [:index, :show], defaults: {format: :json} do
        collection do
          get 'find', to:'transactions/find#show'
        end
      end


    end #v1
  end #api
end
