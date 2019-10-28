class Routing
  include Mongoid::Document
  field :job_code, type: String
  field :start_time, type: Time
  field :end_time, type: Time

  has_many :locations

end
