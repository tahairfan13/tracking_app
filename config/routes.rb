Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  namespace :auth do
    post '/register', to: 'registration#create'
    post '/verification', to: 'verification#create'
  end

  resources :routes
end
