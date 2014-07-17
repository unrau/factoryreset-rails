Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:create]
  resources :chats, only: [:create, :destroy]
  resources :events do
    resources :comments
    resources :rsvps, only: [:create, :destroy]
  end

  root 'events#index'

  get '/new', to: 'events#new', as: :create
  get '/old', to: 'events#old', as: :old
  get '/signup', to: 'users#new', as: :signup
  get '/login', to: 'sessions#new', as: :login
  match '/logout', to: 'sessions#destroy', via: 'delete'

end
