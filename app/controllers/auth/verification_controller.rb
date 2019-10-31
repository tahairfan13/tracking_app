require 'json_web_token.rb'

class Auth::VerificationController < ApplicationController

  before_action :verify_secret_key

  def create
    if check_session_exist(@project)
      render json: {status: 200, token: @session[0].token}
    else
      @session = Auth::Session.new(token: @token, project_id: @project.id)
      if @session.save
        render json: {status: 201, token: @session.token}
      end
    end
  end

  private

  def check_session_exist(project)
    @token = JsonWebToken.encode(project.secret_key)
    @session = Auth::Session.where(token: @token, project_id: project.id)
    if @session[0]
      return true
    end
  end

  def verify_secret_key
    @project = Auth::Project.where(secret_key: params[:secret_key])
    unless @project[0]
      render json: {status:401, message:'you have entered an invalid secret key'}
    end
    @project = @project[0]
  end
end
