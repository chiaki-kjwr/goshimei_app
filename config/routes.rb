Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#home'
  get  'pages/about'
  get  'pages/help'
  get  'pages/terms'
  get  'pages/company_home', to: 'pages#company_home',as:'companies_home'
  

  #get '/users/:id', to: 'users#show',as: 'user'
  #delete 'users/:id', to: 'users#destroy',as:'user_destroy'
  #delete '/user/:id',to: 'users#destroy'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show',as:'user'
  delete '/users/:id',to: 'users#destroy'
  resources :companies,only: %i(index new show create edit update)
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts,only: %i(new create) 
  resources :posts, only: %i(index new create show) do
    resources :likes, only: %i(create destroy)
  end

  resources :chat_rooms, only: %i(index show new create)do
    resources :chat_messages,only: %i(new create)
  end
end
  