class Driver
  include Mongoid::Document
  field :driver_id, type: Integer
  has_many :locations
end
