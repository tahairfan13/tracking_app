class ApplicationController < ActionController::API

  def authenticate_user
    token = request.env['warden'].authenticate
    unless token
      render json: {status: 401, message: request.env['warden'].message}
    end
  end

end
