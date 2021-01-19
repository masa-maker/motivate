class CommentsController < ApplicationController
  before_action :set_item, only: :destroy
  before_action :move_to_index, only: [:create, :destroy] 
  before_action :only_action, only: :destroy
  def create
    if comment = Comment.create(comment_params) 
      redirect_to post_path(comment.post.id)
    else
      render  template: "posts/show"
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_item
    @comment = Comment.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def only_action
    if current_user.id != @comment.user.id
      redirect_to root_path
    end
  end
end
