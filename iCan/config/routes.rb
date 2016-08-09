Rails.application.routes.draw do
  resources :articles
  # This route sends requests to our naked url to the *cool* action in the *gif* controller.
  root to: 'pages#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'signup' => 'users#new', as: 'signup'
  resources :users
end
