Rails.application.routes.draw do
  root to: 'items#index'
  get  "/signup/create2" => redirect("/signup/create1")
  get  "/signup/create3" => redirect("/signup/create1")
  get  "/signup/create4" => redirect("/signup/create1")
  get  "/signup/create5" => redirect("/signup/create1")
  get  "/signup/create6" => redirect("/signup/create1")

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
      get 'create1'
      get 'create2'
      get 'create3'
      get 'create4'
      get 'create5'
      get 'create6'
    end
  end
end
