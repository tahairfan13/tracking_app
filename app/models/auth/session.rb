class Auth::Session
  include Mongoid::Document
  field :token, type: String
  field :verification_id, type: Integer

  #associations
  belongs_to :project

  #validations
  validates :token, presence: true
end
