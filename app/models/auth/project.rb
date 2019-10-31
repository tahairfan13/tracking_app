class Auth::Project
  include Mongoid::Document
  field :secret_key, type: String
  field :name, type: String
  field :user_type, type: Integer

  #associations
  has_many :sessions

  #validations
  validates :name, presence: true
  validates :secret_key, presence: true, uniqueness: true
  validates :user_type, presence: true, uniqueness: true
end
