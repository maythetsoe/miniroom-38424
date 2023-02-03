Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'users/index', to: 'users#index'
  root 'minirooms#index'
  resources :users, only: [:new, :show]
  resources :minirooms do
  resource :miniroomfavorites, only: [:create, :destroy]
  resources :miniroomcomments, only: :create
  end

  resources :donations do
    resources :receives, only: [:index, :new, :create]
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end
end