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
  resources :logouts
end
