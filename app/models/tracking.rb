class Tracking
  include Mongoid::Document
  field :start_time, type: Time
  field :end_time, type: Time

  has_many :locations
end
