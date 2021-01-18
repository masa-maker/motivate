class CommentsController < ApplicationController

  def create
    if comment = Comment.create(comment_params) 
      redirect_to post_path(comment.post.id)
    else
      render  template: "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
