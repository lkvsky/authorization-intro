class UsersController < ApplicationController
  before_filter :current_user, :except => [:new, :create]
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    begin
      @user.save!
      flash[:notice] = "You have created a new account."
      UserMailer.welcome_email(@user).deliver
      redirect_to new_session_path
    rescue
      flash[:notice] = @user.errors.full_messages.first
      redirect_to new_user_path
    end
  end

  def edit
  end

  def show
    @post = Post.new
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
