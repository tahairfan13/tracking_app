class RoutingChannel < ApplicationCable::Channel
  def subscribed
     stream_from "route_channel"
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @routing = Routing.find_by(job_id: data["data"]["job_id"])
    location = @routing.locations.create(lat: data["data"]["lat"], long: data["data"]["long"], created_at: Time.now, driver_id: data["data"]["driver_id"])
    RoutingChannelJob.perform_now(location)
  end
end
