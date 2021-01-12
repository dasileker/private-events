Rails.application.routes.draw do

  root 'static_pages#home'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup',  to: 'user#new'
  post '/signup', to: 'user#create'
  resources :user,  only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
