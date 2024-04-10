Rails.application.routes.draw do
  
  devise_for :admins
  root "home#index"

  # Defines the /admin path route
  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  namespace :admin, path: '', as: '' do
    resources :categories
  end
  
  get "admin" => "admin#index"
end
