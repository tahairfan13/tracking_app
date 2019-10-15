class Routing
  include Mongoid::Document
  field :job_id, type: String
  field :start_time, type: Time
  field :end_time, type: Time

  has_many :locations

end
