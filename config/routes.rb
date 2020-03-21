Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get  'pages/about'
  get  'pages/help'
  get  'pages/terms'

  get '/users/:id', to: 'users#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  

end

