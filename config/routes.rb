Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :users do
  	resources :carts
  end

  namespace :admin do
  	root to: 'dashboard#index'
  	resources :users
  end

  root to: "items#index"
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
