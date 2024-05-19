Rails.application.routes.draw do 
  devise_for :admins
  root "home#index"
  
  # Defines the /admin path route
  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end
  
  namespace :admin do
    resources :orders
    resources :categories
    resources :products do
      resources :stocks
    end
  end

  resources :categories, only: [:show]
  resources :products, only: [:show]
  get "admin" => "admin#index"
end
