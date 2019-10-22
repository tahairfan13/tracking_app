require 'json_web_token.rb'

class Auth::VerificationController < ApplicationController

  def create
    verification = Auth::Verification.find_by(secret_key: params[:secret_key])
    if verification
      token = JsonWebToken.encode(verification.secret_key)
      session = Auth::Session.new(token: token, verification_id: verification.id)
      if session.save
        render json: {status: 201, token: token}
      end
    else
      render json: {status:401, message:'you have entered an invalid secret key'}
    end
  end
end