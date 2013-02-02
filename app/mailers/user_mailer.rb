class UserMailer < ActionMailer::Base
  default from: "from@kandb.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/session/new"
    mail(:to => @user.username, :subject => "Welcome to this app! Love it.")
  end
end
