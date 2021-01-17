class ProfilesController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :move_to_index,  only: [:index, :edit]
  def index
    @profile = Profile.new
  end

  def create
    profile = Profile.create(profile_params)
    redirect_to post_path(profile.user.id)
  end

  def edit 
  end

  def update
    @profile.update(profile_params)
    redirect_to user_path(@profile.user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:info, :image).merge(user_id: current_user.id)
  end

  def set_item
    @profile = Profile.find(params[:id])
  end

  def move_to_index
    if current_user.id != @profile.user.id
      redirect_to root_path
    end
  end
end
