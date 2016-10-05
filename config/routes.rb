Rails.application.routes.draw do

  root 'spots#index'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }

  get 'profile/:id', to: 'profiles#show', as: 'profile'
  get 'spots/:id/like', to: 'spots#like', as: 'like'
  get '/search', to: 'spots#search', as: 'search'

  post 'spots/:id/new_comment', to: 'spots#new_comment', as: 'spot_comments'
  post 'spots/:spot_id/addresses/new', to: 'addresses#create', as: 'addresses'
  post '/spots/:id/show', to: 'spots#add_image', as: 'spot_pictures'

  delete 'spots/:spot_id/comment/:id', to: 'spots#delete_comment', as: 'delete_comment'
  delete '/spots/picture/:id', to: 'spots#delete_picture', as: 'delete_spot_picture'

  resources :spots
end
