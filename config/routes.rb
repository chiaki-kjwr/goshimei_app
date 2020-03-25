Rails.application.routes.draw do
  devise_for :users
  
  root 'pages#home'
  get  'pages/about'
  get  'pages/help'
  get  'pages/terms'

  get '/users/:id', to: 'users#show', as: 'user'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  

end

