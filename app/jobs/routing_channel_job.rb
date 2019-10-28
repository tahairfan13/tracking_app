class RoutingChannelJob < ApplicationJob
  queue_as :default

  def perform(message, job_id)
    ActionCable.server.broadcast "route_channel_#{job_id}", data: message
  end

end
