Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users
  resources :items
  resources :addresses
  resources :shipping_addresses
  resources :payments
  resources :mypages, only:[:edit,:index]
  resources :cards
  resources :trades
  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'create2'
      get 'create3'
      get 'create4'
      get 'create5'
    end
  end

end
