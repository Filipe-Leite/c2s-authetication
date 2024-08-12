Rails.application.routes.draw do

  post '/login', to: 'auth#login'
  post '/register', to: 'auth#register'
  get '/validate_token', to: 'auth#validate_token'

end
