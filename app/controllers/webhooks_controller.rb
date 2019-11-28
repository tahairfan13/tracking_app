class WebhooksController < ApplicationController
  before_action :authenticate_user

  def create_route
    data = JSON.parse(request.body.read)
    routing = Routing.new(job_code: data['job_code'], start_time: data['start_time'], end_time: data['end_time'], session: @session )
    routing.save
    head :ok
  end

end
