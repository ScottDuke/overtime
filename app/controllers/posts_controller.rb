class PostsController < ApplicationController
  before_action :set_post, only: %w(show edit update destroy)

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.valid?
      @post.save
      redirect_to @post, notice: "Post has been created successfully"
    else
      render :new, notice: "Could not create post"
    end
  end

  def show;end

  def edit;end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post has been updated successfully"
    else
      render :edit, notice: "Could not update post"
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post has been updated successfully"
    else
      redirect_to @post, notice: "Unable to delete post"
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
