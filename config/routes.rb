Rails.application.routes.draw do
  devise_for :users

  resources :friendships
  resources :users, only: [:index]

  resources :conversations, only: [:index, :create] do
    resources :messages
  end

  root "friendships#index"
end
