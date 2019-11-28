class Auth::Session
  include Mongoid::Document
  field :token, type: String

  #associations
  belongs_to :project
  has_many :routings

  #validations
  validates :token, presence: true
end
