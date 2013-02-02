class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user, :logged_in?

  def current_user
    redirect_to new_session_path unless logged_in?
  end

  def logged_in?
    session[:session_token] && User.find_by_session_token(session[:session_token])
  end

end
