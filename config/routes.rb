Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'users/index', to: 'users#index'
  root 'minirooms#index'
  # resources :users, only: [:new, :show]
  resources :users do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
  end

  resources :minirooms do
  resource :miniroomfavorites, only: [:create, :destroy]
  resources :miniroomcomments, only: :create
  collection do
    get 'search'
  end
  end

  resources :donations do
    resources :receives, only: [:index, :new, :create]
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end