Rails.application.routes.draw do

  root "spots#index"

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations"
  }

  resources :spots

  get "profile/:id", to: "profiles#show", as: "profile"

end
