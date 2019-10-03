Rails.application.routes.draw do
  namespace :auth do
    post '/register', to: 'registration#create'
    post '/verification', to: 'verification#create'
  end
end
