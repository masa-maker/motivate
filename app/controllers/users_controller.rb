class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])
    @posts = user.posts
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_followings'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_followers'
  end
end
