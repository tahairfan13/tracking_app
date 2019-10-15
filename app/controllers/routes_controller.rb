class RoutesController < ApplicationController
 before_action :authenticate_user

  def index
    response =ActionCable.server.broadcast 'route_channel', data: 'wow'
    render json: {message: response}
  end
end