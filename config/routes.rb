Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users
  resources :items
  resources :mainmypages, only: [:index]
  resources :mypages, only: [:edit]
end