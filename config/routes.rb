Rails.application.routes.draw do

  devise_for :users
  
  root 'users#show'

  resources :friendships, only: [:create, :update, :destroy]
end
