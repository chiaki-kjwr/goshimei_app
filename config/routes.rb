Rails.application.routes.draw do
  
  devise_for :users,
    controllers: { registrations: 'registrations' }
  
  root 'pages#home'
  get  'pages/about'
  get  'pages/help'
  get  'pages/terms'
  

  #get '/users/:id', to: 'users#show',as: 'user'
  #delete 'users/:id', to: 'users#destroy',as:'user_destroy'
  #delete '/user/:id',to: 'users#destroy'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show',as:'user'
  delete '/users/:id',to: 'users#destroy'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  resources :posts, only: %i(index new create show edit) 
  resources :chat, only: %i(index show create)do
    resources :chat_messages #only: %i( create)
  end
end
  