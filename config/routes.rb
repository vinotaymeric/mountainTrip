Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :itineraries, only: [:index, :show] do
    resources :trips, only: [:new, :create]
  end

  resources :trips, only: [:show, :index, :edit, :update] do
    resources :messages, only: [:index, :new, :create, :update, :edit]
    resources :user_trips, only: [:create]
  end

  resources :user_trips, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end

  get "my_trips", to: "trips#my_trips"

end
