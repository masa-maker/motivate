class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])
    @posts = user.posts
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
  end
end
