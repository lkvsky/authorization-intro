class User <ActiveRecord::Base

  attr_accessible :username, :password, :password_confirmation, :session_token

  has_secure_password

  validates :username, :presence => true, :uniqueness => true,
    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "That is invalid."}
  validates :password, :length => { :minimum => 5, :maximum => 20 }, :if => :update_password

  def log_out
    self.session_token = nil
  end

  def update_password
  end

end
