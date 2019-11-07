class ApplicationController < ActionController::API

  def authenticate_user
    @session = request.env['warden'].authenticate
    unless @session
      render json: {status: 401, message: request.env['warden'].message}
    end
  end

end
