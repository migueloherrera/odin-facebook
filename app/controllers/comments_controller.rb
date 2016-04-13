class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id  
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to request.referer, notice: 'Comment successfully added.'
    else
      redirect_to request.referer, alert: "Your comment could not be saved#{@comment.post}.#{@comment.user}."
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
