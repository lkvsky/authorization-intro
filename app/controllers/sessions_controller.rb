class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where(:username => params[:user][:username]).first

    if @user.authenticate(params[:user][:password])
      @user.session_token = (0...8).map{65.+(rand(26)).chr}.join
      @user.save
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
    @user = User.find(params[:id])
    @user.log_out
    redirect_to new_session_path
  end
end
