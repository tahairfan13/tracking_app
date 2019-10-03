class Auth::Verification
  include Mongoid::Document
  field :secret_key, type: Integer

  has_many :sessions
end
