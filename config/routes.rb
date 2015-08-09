Rails.application.routes.draw do

  root 'hub#index'

  resources :users, except: [:index, :destroy]

  resources :projects do
    resources :collaborations, only: [:create, :update]
  end

  resources :tags, only: [:index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  get '/locations/search' => 'locations#search', as: :search

end
