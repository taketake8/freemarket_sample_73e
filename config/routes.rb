Rails.application.routes.draw do 
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :users, only: [:show, :destroy]
  resources :credit_cards, only: [:new, :create, :show, :destroy] 
  resources :items do
    collection do
      get "get_delivery_method"
      get "set_parents"
      get "set_children"
      get "set_grandchildren"
    end
    member do
      get "buy"
      get "pay"
    end
  end
end
