Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :itineraries, only: [:index, :show] do
    resources :trips, only: [:new, :create]
  end
  resources :trips, only: [:new, :create, :show, :index, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
