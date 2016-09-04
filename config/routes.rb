Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :thoughts

  # home page
  root 'pages#index'

  # create new user
  get 'signup' => 'users#new'


  # signup new user
  get 'signup' => 'users#new'

  # lets me log in
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # logout
  get 'logout' => 'sessions#destroy'

  # user profile by username
  get '/:username' => 'users#show'
end
