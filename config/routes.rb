Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :followings
      get :followers
      get :favorites
    end
  end

  resources :games, only: [:index,:new, :show, :create] do
    member do
      resources :reviews, only: [:new, :create, :destroy, :edit, :update]
    end
  end
  

  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  

end
