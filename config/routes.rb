Rails.application.routes.draw do
  get '/rooms', to: 'rooms#index'
  get 'rooms/new', to: 'rooms#new'
  get 'rooms/posts', to: 'rooms#show'
  get 'rooms/:id', to: 'rooms#search'

  devise_for :users,controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
