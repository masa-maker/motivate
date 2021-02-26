class HomesController < ApplicationController
before_action :move_to_index
  def index
  end

  def move_to_index
    if user_signed_in?
      redirect_to controller: :posts, action: :index
    end
  end
end
