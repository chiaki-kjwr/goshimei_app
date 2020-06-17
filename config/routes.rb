Rails.application.routes.draw do
  devise_for :users,
              controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'pages#home'
  get  'pages/about'
  get  'pages/help'
  get  'pages/terms'
  get  'pages/company_home', to: 'pages#company_home', as: 'companies_home'

  # get '/users/:id', to: 'users#show',as: 'user'
  # delete 'users/:id', to: 'users#destroy',as:'user_destroy'
  # delete '/user/:id',to: 'users#destroy'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  delete '/users/:id', to: 'users#destroy'
  resources :companies, only: %i(index new show create edit update)
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/pages/guest_sign_in', to: 'pages#new_guest'
  get 'search',to:'posts#search'


  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts, only: %i(new create)
  resources :posts, only: %i(index new create show), shallow: true do
    resource :likes, only: %i(create destroy)
    get :likes, on: :collection
  end

  resources :chat_rooms, only: %i(index show create) do
    resources :chat_messages, only: %i(new create)
  end
  post '/chat_rooms', to: 'chat_rooms#create', as: 'create_chat'
end
