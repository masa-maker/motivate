class CommentsController < ApplicationController
  before_action :set_item, only: :destroy
  before_action :move_to_index, only: [:create, :destroy] 
  before_action :only_action, only: :destroy
  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params) 
    if comment.valid?
      comment.save
      redirect_to post_path(comment.post.id)
    else
      flash[:notice] = 'commentを入力してください'
      redirect_to  post_path(comment.post.id)
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
