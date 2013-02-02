class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_session_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def show
    @user = User.find_by_session_token(session[:session_token])
    if @user.session_token != session[:session_token]
      redirect_to new_session_path
    end
  end

  def update
  end

  def destroy
  end
end
