Rails.application.routes.draw do
  resources :cars
  resources :users
  resources :reservations
  root to: 'home#index'
  match 'create_reservation', to: 'home#create_reservation', via: [:post]
  match '/coverage/index', :to => redirect('/coverage/index.html'), via: [:get]
  match 'about', to: 'home#about', via: [:get]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
