class Driver
  include Mongoid::Document
  field :driver_id, type: Integer

  #associations
  has_many :locations

end
