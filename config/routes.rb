Rails.application.routes.draw do

  mount ForestLiana::Engine => '/forest'
  root 'static_pages#home'

  # root 'spots#index'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }

  mount Attachinary::Engine => "/attachinary"

  resources :spots

  # mad id route
  get '/spots/:id/lat_long', to: 'spots#lat_long'
  get 'profile/:id', to: 'profiles#show', as: 'profile'
  get '/search', to: 'spots#search', as: 'search'
  get 'spots/:id/like', to: 'likes#create', as: 'like'

  post 'spots/:id/new_comment', to: 'comments#create', as: 'spot_comments'
  post '/spots/:id/show', to: 'spots#add_image', as: 'spot_pictures'


  delete 'spots/:spot_id/comment/:id', to: 'comments#delete', as: 'delete_comment'
  delete '/spots/picture/:id', to: 'spots#delete_picture', as: 'delete_spot_picture'
  delete 'spots/:id/like', to: 'likes#destroy', as: 'unlike'

  resources :spots
  resources :photos, only: [:index, :new, :create]
end
