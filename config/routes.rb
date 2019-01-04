Rails.application.routes.draw do
  get 'carts/show'
  root 'static_pages#home'
  get 'signin', to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  post '/user_items/new', to: "user_items#new"
  delete '/signout', to: "sessions#destroy"
  get '/auth/facebook/callback' => 'sessions#create'
  resources :users do
    resources :cart, only: [:index]
    resources :items, only: [:new]
  end
  resources :user_items, only: [:new, :edit, :update]
  resources :purchases
end
