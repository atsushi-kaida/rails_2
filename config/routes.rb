Rails.application.routes.draw do
  get 'rooms/posts',   to: 'rooms#posts'
  get 'rooms/search',  to: 'rooms#search'
  

  devise_scope :user do
    get 'users/profile',  to: 'users/registrations#profile'
    post 'users/profile', to: 'users/registrations#editprofile'
    get 'users/account',  to: 'users/registrations#account'
  end
  resources :rooms
  resources :reservations

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: "home#index"
end
