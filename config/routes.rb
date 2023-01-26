Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'users/index', to: 'users#index'
  root 'minirooms#index'
  resources :users, only: :new  
  resources :minirooms, only: [:new, :index, :create, :edit, :show, :update, :destroy]
  resources :donations, only: [:index, :new, :create, :edit, :show, :update, :destroy]
end