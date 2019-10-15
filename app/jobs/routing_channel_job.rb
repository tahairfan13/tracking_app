class RoutingChannelJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'route_channel', data: message
  end

end
