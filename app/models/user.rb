class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation, :session_token

  has_secure_password
  has_many :posts

  validates :name, :presence => true, :length => { :minimum => 3, :maximum => 20 }
  validates :email, :presence => true, :uniqueness => true,
    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "That is invalid."}
  validates :password, :length => { :minimum => 5, :maximum => 20 }, :if => :update_password

  def log_out
    self.session_token = nil
  end

  def recent_posts_first
    self.posts.order('id DESC')
  end

  def update_password
  end

end
