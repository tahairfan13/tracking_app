class Routing
  include Mongoid::Document
  field :job_code, type: String
  field :start_time, type: Time
  field :end_time, type: Time

  #associations
  has_many :locations

  #validations
  validates :job_code, presence: true

end
