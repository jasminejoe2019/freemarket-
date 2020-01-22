Rails.application.routes.draw do
  root to: 'items#index'
  resources :users
  resources :items
  resources :addresses
  resources :shipping_addresses
  resources :payments
  resources :mypages, only:[:edit,:index]
  resources :cards
  resources :trades
  resources :logouts
  resources :registrations, only:[:index,:create]
  resources :sessions, only:[:index,:destroy,:create]
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
