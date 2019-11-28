Rails.application.routes.draw do
  resources :charges
  resources :orders
  devise_for :users

  Rails.application.routes.draw do
    resources :users do
  	 resources :carts
    end
  end

  namespace :admin do
  	root to: 'dashboard#index'
  	resources :users
  end

  root to: "items#index"
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mon_panier, only: [:index]
  resources :mon_profil, only: [:index]
end
