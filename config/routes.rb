Rails.application.routes.draw do
  root to: 'items#show'
  devise_for :users
  resources :users
  resources :items
end
