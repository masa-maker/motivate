class ProfilesController < ApplicationController
  def index
    @profile = Profile.new
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to post_path(profile.user.id)
  end

  def edit 
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to user_path(@profile.user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:info, :image).merge(user_id: current_user.id)
  end
end
