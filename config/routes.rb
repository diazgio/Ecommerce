Rails.application.routes.draw do 
  devise_for :admins
  root "home#index"
  
  # Defines the /admin path route
  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end
  
  namespace :admin do
    resources :stocks
    resources :categories
    resources :products
  end
  
  get "admin" => "admin#index"
end
