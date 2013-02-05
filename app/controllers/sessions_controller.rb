class SessionsController < ApplicationController
  before_filter :current_user, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session_token = SecureRandom.base64
      @user.session_token = session_token
      @user.save!
      session[:session_token] = session_token
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])
    @user.log_out
    session[:session_token] = nil
    flash[:notice] = "You are successfully logged out."
    redirect_to new_session_path
  end
end
