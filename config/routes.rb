Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Routes for Google Authentication
  get '/o/oauth2/v2/auth', to: 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end
