Rails.application.routes.draw do
  root to: 'itineraries#index'
  resources :itineraries, only: [:index, :show]
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
