Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Routes for Google Authentication
  # get '/o/oauth2/v2/auth', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/failure', to: redirect('/')
  get '/dashboard', to: 'dashboard#show'
  get '/movies/top_10', to: 'movies#top_10', as: 'top_10'
  post '/friends', to: 'friendships#create'
end
