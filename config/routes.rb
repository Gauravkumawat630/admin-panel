Rails.application.routes.draw do
  get "pages/home"
  get "pages/about"
  resources :posts
  resources :users
  resource :products
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index]
      resources :orders,   only: [:index]
      resources :users, only: [:index, :show]

      ActiveAdmin.routes(self)

    end
  end
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
    resources :users, only: [:index]

  root 'pages#home'
  # Defines the root path route ("/")
  # root "posts#index"
end
