class Location
  include Mongoid::Document
  field :lat, type: Float
  field :long, type: Float
  field :created_at, type: Time
  field :driver_id, type: Integer
  field :tracking_id, type: Integer

  belongs_to :tracking
end
