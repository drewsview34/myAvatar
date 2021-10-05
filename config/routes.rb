Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get 'signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#signin'
  get 'sessions/new', to: 'sessions#new'
  get '/sessions/create', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  resources :avatar
  resources :option
  resources :user

end
