class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to current_user, notice: 'Post was successfully created.'
    else
      redirect_to current_user, alert: "Invalid information entered."
    end
  end

  def destroy
    @post.destroy
    redirect_to current_user, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
