Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Routes for Google Authentication
  get '/auth/google_oauth2', to: 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end
