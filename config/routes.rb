Rails.application.routes.draw do
  root to: 'items#index'
    get 'items/new'
  devise_for :users
  resources :users
  resources :items, only: [:index, :show, :new, :edit, :destroy, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json'}
    end
  resources :addresses
  resources :shipping_addresses
  resources :payments
  resources :mypages, only:[:edit,:index]
  resources :cards
  resources :trades
  resources :logouts
  end
end
