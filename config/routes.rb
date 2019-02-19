Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, only: [:index, :show] do
    resources :trips, only: [:new, :create]
  end
  resources :trips, only: [:show, :index, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
  end
end