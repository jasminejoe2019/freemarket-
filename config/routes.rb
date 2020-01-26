Rails.application.routes.draw do
  root to: 'items#index'
  # resources :users
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
      get 'create1'
      get 'create2'
      get 'create3'
      get 'create4'
      get 'create5'
      get 'create6'
    end
  end
  resources :logouts
  resources :registrations, only:[:index,:create]
  resources :sessions, only:[:index,:destroy,:create]
  devise_for :users,
  controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # sessions: 'users/sessions',
    # registrations: 'users/registrations'
  }
end
