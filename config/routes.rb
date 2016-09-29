Rails.application.routes.draw do

  root 'spots#index'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }

  # mad id route
  get '/spots/:id/lat_long', to: 'spots#lat_long'
  get 'profile/:id', to: 'profiles#show', as: 'profile'
  get 'spots/:id/like', to: 'spots#like', as: 'like'
  get '/search', to: 'spots#search', as: 'search'

  post 'spots/:id/new_comment', to: 'spots#new_comment', as: 'spot_comments'
  post 'spots/:spot_id/addresses/new', to: 'addresses#create', as: 'addresses'

  delete 'spots/:spot_id/comment/:id', to: 'spots#delete_comment', as: 'delete_comment'

  resources :spots
end
