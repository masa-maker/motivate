class GoodsController < ApplicationController
  def create
    @good = Good.new(good_id: params[:good_id]. user_id: current_user.id)
    @good.save
    @post = Post.find_by(:id @good.good_id)
    @goods = Good.where(good_id: @post.id)
  end

  def destroy
    @good = Good.find_by(good_id: params[:good_id], user_id: current_user.id)
    @post = Post.find_by(id: @post.post_id)
    @post.destroy
    @goods = Good.where(good_id: @post.id)
  end
end
