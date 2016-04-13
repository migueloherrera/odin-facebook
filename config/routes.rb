Rails.application.routes.draw do

  resources :posts, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  devise_for :users
  
  root 'users#index'
  get '/user' => 'users#show'

  resources :friendships, only: [:create, :update, :destroy]
end
