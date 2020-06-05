Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/users/:id/settings' => 'users#settings', as: :account_settings

  resources :books do
    resources :reflections
  end

  resources :users
  resources :books
  resources :reflections

end
