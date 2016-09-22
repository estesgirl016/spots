Rails.application.routes.draw do

  root 'spots#index'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }

  resources :spots

  get 'profile/:id', to: 'profiles#show', as: 'profile'
  get 'spots/:id/like', to: 'spots#like', as: 'like'

  post 'spots/:id/new_comment', to: 'spots#new_comment', as: 'spot_comments'

  delete 'spots/:spot_id/comment/:id', to: 'spots#delete_comment', as: 'delete_comment'

end
