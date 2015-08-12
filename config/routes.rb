Rails.application.routes.draw do

  root 'hub#index'

  get '/projects/results' => 'projects#results'
  get '/hub/video' => 'hub#video'
  resources :users, except: [:index, :destroy, :new]

  resources :projects do
    resources :collaborations, only: [:create, :update]
  end

  resources :tags, only: [:index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'

  get 'mailbox/inbox' => 'mailbox#inbox', as: :mailbox_inbox
  get 'mailbox/sent' => 'mailbox#sent', as: :mailbox_sent
  get 'mailbox/trash' => 'mailbox#trash', as: :mailbox_trash

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
