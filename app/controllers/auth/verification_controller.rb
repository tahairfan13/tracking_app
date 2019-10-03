require 'json_web_token.rb'

class Auth::VerificationController < ApplicationController

  def create
    verification = Auth::Verification.where(secret_key: params[:secret_key])
    if verification.length > 0
      verification = verification[0]
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