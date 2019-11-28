class RoutingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "route_channel_#{params['job_code']}"
  end

  def unsubscribed
    stop_all_streams
  end

  def send_location(data)
    @routing = Routing.find_by(job_code: data["job_code"])
    location = @routing.locations.create(lat: data["lat"], long: data["long"], created_at: Time.now, driver_id: data["driver_id"])
    RoutingChannelJob.perform_now(location, @routing.job_code)
  end
end
