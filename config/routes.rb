Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Routes for Google Authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  get '/dashboard', to: 'dashboard#show'
end
