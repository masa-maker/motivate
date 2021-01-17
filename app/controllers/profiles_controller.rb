class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index,  only: :edit
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to user_path(@profile.user.id)
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

  def move_to_index
    if current_user.id != current_user.id
      redirect_to root_path
    end
  end
end
