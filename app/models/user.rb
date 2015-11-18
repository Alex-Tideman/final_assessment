class User < ActiveRecord::Base
  has_secure_password
  has_many :links
  validates :email, presence: true,
            uniqueness: true
  validates :password, :password_confirmation, presence: true
  validates_confirmation_of :password

end
