class User <ActiveRecord::Base

  attr_accessible :username, :password_digest, :session_token

  has_secure_password

  validates :username, :presence => true, :uniqueness => true

  def log_out
    self.session_token = nil
  end

end
