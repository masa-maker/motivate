class RelationshipsController < ApplicationController
  before_action :set_item

  def create
    following = current_user.follow(@user)
    following.save
    redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    redirect_to @user
  end
  
  private

  def set_item
    @user = User.find(params[:relationship][:follow_id])
  end

end
