require 'json_web_token.rb'

class Auth::VerificationController < ApplicationController

  before_action :verify_secret_key

  def create
    if check_session_exist(@verification)
      render json: {status: 200, token: @session[0].token}
    else
      @session = Auth::Session.new(token: @token, verification_id: @verification.id)
      if @session.save
        render json: {status: 201, token: @session.token}
      end
    end
  end

  private

  def check_session_exist(verification)
    @token = JsonWebToken.encode(verification.secret_key)
    @session = Auth::Session.where(token: @token, verification_id: verification.id)
    if @session[0]
      return true
    end
  end

  def verify_secret_key
    @verification = Auth::Verification.where(secret_key: params[:secret_key])
    unless @verification[0]
      render json: {status:401, message:'you have entered an invalid secret key'}
    end
    @verification = @verification[0]
  end
end
