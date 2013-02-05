class PostsController < ApplicationController
  def create
    @post = Post.new
    user = User.find_by_session_token(session[:session_token])
    @post.text = params[:post][:text]
    @post.user_id = current_user.id
    @post.save!

    redirect_to user_path(current_user)
  end
end
