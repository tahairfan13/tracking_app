class Location
  include Mongoid::Document
  field :lat, type: Float
  field :long, type: Float
  field :created_at, type: Time
  field :driver_id, type: Integer
  field :tracking_id, type: Integer

  #association
  belongs_to :routing

  #validations
  validates :lat, presence: true
  validates :long, presence: true
  validates :created_at, presence: true
  validates :driver_id, presence: true

end
