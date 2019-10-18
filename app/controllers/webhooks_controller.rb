class WebhooksController < ApplicationController
  before_action :authenticate_user

  def create_route
    data = JSON.parse(request.body.read)
    routing = Routing.new(job_id: data['job_id'], start_time: data['start_time'], end_time: data['end_time'] )
    routing.save
    head :ok
  end

end
