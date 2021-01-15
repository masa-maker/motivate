class PostsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @posts = Post.includes(:user).order("created_at DESC")
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

private

def post_params
  params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to root_path
  end
end
end
