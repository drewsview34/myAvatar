Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  post '/users/:id', to: 'users#show', as: 'user'
  post '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'

  get '/options', to: 'options#index', as: 'options'
  get '/options/new', to: 'options#new', as: 'new_option'
  get '/options/:id', to: 'options#show', as: 'option'
  patch '/options/:id/edit', to: 'options#edit', as: 'edit_option'
  post '/options', to: 'options#create'
  post '/options', to: 'options#create'

  post '/avatars', to: 'avatarss#create', as: 'avatars'


  resources :avatars
  resources :options
  resources :users

end
