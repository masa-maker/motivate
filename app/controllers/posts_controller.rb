class PostsController < ApplicationController
  before_action :set_item, only: [:show,  :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:destroy, :edit] 
  
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
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
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
