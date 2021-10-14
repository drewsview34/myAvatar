Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get '/signin', to: 'session#signin'
  get '/signin', to: 'session#signin'
  post '/signin', to: 'session#signin'
  get '/session/new', to: 'session#new'
  get '/session/create', to: 'session#create'
  get '/logout', to: 'session#destroy'
  delete '/logout', to: 'session#destroy'


  resources :avatars
  resources :options
  resources :users

end
