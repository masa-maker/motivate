class GoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def create
    user = current_user
    post = Post.find(params[:post_id])
    good = Good.create(user_id: user.id, post_id: post.id)
  end

  def destroy
    user = current_user
    post = Post.find(params[:post_id])
    good = Good.find_by(user_id: user.id, post_id: post.id)
    good.destroy
  end

private

  def set_item
    @post = Post.find(params[:post_id])
  end
end
