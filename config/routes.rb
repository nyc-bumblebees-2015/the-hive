Rails.application.routes.draw do

  root 'hub#index'

  resources :users, except: [:index, :destroy]

  resources :projects

  resources :collaborations, only: [:create, :update]

  resources :tags, only: [:index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  post '/projects/search' => 'projects#search', as: :search

end
