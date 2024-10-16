Rails.application.routes.draw do

  post '/auth/login', to: 'auth#login'
  post '/auth/register', to: 'auth#register'
  get '/auth/validate_token', to: 'auth#validate_token'
  delete '/auth/logout', to: 'auth#logout'

end
