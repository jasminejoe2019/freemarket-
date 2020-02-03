Rails.application.routes.draw do
  root to: 'items#index'
    get 'items/new'
  resources :items, only: [:index, :show, :new, :edit, :destroy, :create] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json'}
    end
    resources :images
  end
  resources :addresses
  resources :shipping_addresses
  resources :payments
  resources :mypages, only:[:edit,:index]
  resources :cards
  resources :trades
  resources :signup do
    collection do
      get 'user_create'
      get 'user_create_profile'
      get 'user_create_telephone'
      get 'user_create_address'
      get 'user_create_payment'
      get 'user_create_finish'
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
