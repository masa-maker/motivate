class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    if @comment = Comment.create(comment_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
