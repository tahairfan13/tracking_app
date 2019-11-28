class LocationsController < ApplicationController
  before_action :authenticate_user

  def show
    @routing = Routing.where(job_code: params[:id])
    if @routing[0] and @routing[0].locations.count > 0
      render json: {status: 200, location: @routing[0].locations.last }
    else
      render json: {status: 400, error: 'No location available' }
    end
  end
end
