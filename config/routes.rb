Rails.application.routes.draw do

  root 'home#action'
  mount ActionCable.server, at: '/cable'
  post '/hooks/:create_route', to: 'webhooks#create_route'

  namespace :auth do
    post '/register', to: 'registration#create'
    post '/verification', to: 'verification#create'
  end

  resources :routes
end
