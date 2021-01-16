class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])
    @posts = user.posts
    @user = User.find(params[:id])
  end

  def edit
  end
end
