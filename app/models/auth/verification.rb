class Auth::Verification
  include Mongoid::Document
  field :secret_key, type: Integer
  field :name, type: String

  #associations
  has_many :sessions

  #validations
  validates :name, presence: true
  validates :secret_key, presence: true, uniqueness: true

end
