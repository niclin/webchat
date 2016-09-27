Rails.application.routes.draw do
  devise_for :users

  resources :friendships
  resources :users, only: [:index]

  root "friendships#index"
end
