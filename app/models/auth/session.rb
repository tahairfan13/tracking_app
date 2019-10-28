class Auth::Session
  include Mongoid::Document
  field :token, type: String
  field :verification_id, type: Integer

  #associations
  belongs_to :verification

  #validations
  validates :token, presence: true
end
