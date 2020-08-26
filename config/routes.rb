Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Routes for Google Authentication
  # get '/o/oauth2/v2/auth', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#google_auth'
  get '/auth/failure', to: redirect('/')
  get '/dashboard', to: 'dashboard#show'
  get '/movies/index', to: 'movies#index', as: 'index'
  post '/movies/index', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'
  post '/friends', to: 'friendships#create'
end
