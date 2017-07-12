Rails.application.routes.draw do
  resources :cars
  resources :users
  root to: 'home#index'
  match 'create_reservation', to: 'home#create_reservation', via: [:post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
