Rails.application.routes.draw do

  resources :posts, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: :create
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  root 'users#index'
  get '/user' => 'users#show'

  resources :friendships, only: [:create, :update, :destroy]
end
