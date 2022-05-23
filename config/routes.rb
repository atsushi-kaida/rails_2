Rails.application.routes.draw do
  get 'rooms/posts', to: 'rooms#show'
  get '/search', to: 'rooms#search'

  resources :rooms
  resources :reservations

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/user/:id", to: "users#profile"
    get "users", to: "users/registrations#new"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root to: "home#index"
end
