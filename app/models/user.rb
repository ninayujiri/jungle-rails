class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :email, uniqueness: true, case_sensitive: false
  validates_presence_of :first_name, :last_name, :password, :password_confirmation, :email

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
