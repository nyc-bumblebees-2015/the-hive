Rails.application.routes.draw do

  root 'hub#index'

  resources :users, except: [:index, :destroy, :new]

  resources :projects do
    resources :collaborations, only: [:create, :update]
  end

  resources :tags, only: [:index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  post '/projects/search' => 'projects#search', as: :search

  get 'mailbox/inbox' => 'mailbox#inbox', as: mailbox_inbox
  get 'mailbox/sent' => 'mailbox#sent', as: mailbox_sent
  get 'mailbox/trash' => 'mailbox#trash', as: mailbox_trash

end
