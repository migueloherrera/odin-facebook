class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @like = @post.likes.build(user_id: current_user.id, post_id: @post.id)

    if @like.save
      redirect_to request.referer || root_path
    else
      redirect_to request.referer || root_path, alert: "Something went wrong."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @like.destroy
    redirect_to request.referer || root_path
  end
end
