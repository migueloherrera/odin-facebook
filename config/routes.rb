Rails.application.routes.draw do

  resources :posts
  devise_for :users
  
  root 'users#index'
  get '/user' => 'users#show'

  resources :friendships, only: [:create, :update, :destroy]
end
