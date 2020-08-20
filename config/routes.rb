Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Routes for Google Authentication
<<<<<<< HEAD
  get '/o/oauth2/v2/auth', to: 'sessions#create'
=======
>>>>>>> 0b0875d870ef7dd63e48492de015b2c431f906fe
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  get '/dashboard', to: 'dashboard#show'
end
