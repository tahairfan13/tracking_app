class Auth::Session
  include Mongoid::Document
  field :token, type: String
  field :verification_id, type: Integer

  belongs_to :verification
end
