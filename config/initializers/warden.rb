Rails.application.config.middleware.use Warden::Manager do |manager|
    manager.default_strategies :token
end
#
Warden::Strategies.add(:token) do
    def authenticate!
      token = Auth::Session.where(token: params['token'])
      if token && token.length > 0
        success! token
      else
        fail "Invalid token"
      end
    end
end