Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :thoughts

  # home page
  root 'pages#index'
  post "/" => 'pages#index'

  # create new user
  get 'signup' => 'users#new'
  get '/users/new' => 'users#new'

  # 404 pages
  get 'invalid' => 'pages#invalid'

  # signup new user
  get 'signup' => 'users#new'

  # lets me log in
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # logout
  get 'logout' => 'sessions#destroy'

  # user profile by username
  get '/:username' => 'users#profile'

end
