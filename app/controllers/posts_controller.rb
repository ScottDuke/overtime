class PostsController < ApplicationController
  before_action :set_post, only: %w(show)

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_create_params)
    @post.user = current_user
    
    if @post.valid?
      @post.save
      redirect_to @post, notice: "Post has been created successfully"
    else
      render :new, notice: "Could not create post"
    end
  end

  def show;end

  private
  
  def post_create_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
