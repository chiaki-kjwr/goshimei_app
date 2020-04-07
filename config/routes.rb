Rails.application.routes.draw do
  resource :user, only:[:destroy]
  devise_for :users,
    controllers: { registrations: 'registrations' }
  
  root 'pages#home'
  get  'pages/about'
  get  'pages/help'
  get  'pages/terms'
  

  #get '/users/:id', to: 'users#show',as: 'user'
  #delete 'users/:id', to: 'users#destroy',as:'user_destroy'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  resources :posts, only: %i(index new create show edit) 
  get '/chat',to:'chat#new'
  resources :chat, only: %i(create show)
  
  

end

