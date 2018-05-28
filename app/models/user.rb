class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name, :last_name, :password, :password_confirmation

end
