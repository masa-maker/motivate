class PostsController < ApplicationController
  before_action :set_item, only: :edit
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, only: [:edit] 
  
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

  def edit
  end

private

def post_params
  params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
end

def set_item
  @post = Post.find(params[:id])
end

def move_to_index
  if current_user.id != @post.user_id
    redirect_to root_path 
  end
end
end
