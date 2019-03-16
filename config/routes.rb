Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'relationships', to: 'users#show'
  
  post '/microposts/:id',to: 'favorite#create'
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :like
      post :like,to: 'users#like'
    end
  end
  
  resources :microposts, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy]
  
end