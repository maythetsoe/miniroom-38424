Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # root 'users#index'  
  get 'users/index', to: 'users#index'
  root 'minirooms#index'
  resources :users, only: :new  
  resources :minirooms, only: [:new, :index, :create, :edit, :show, :update, :destroy]
end
