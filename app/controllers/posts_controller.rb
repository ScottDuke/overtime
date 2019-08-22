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
      flash[:success] = "Post has been created successfully"
      redirect_to @post
    else
      flash[:error] = "Could not create post"
      render :new
    end
  end

  def show;end

  def edit;end

  def update
    if @post.update(post_params)
      flash[:success] = "Post has been updated successfully"
      redirect_to @post
    else
      flash[:error] = "Could not update post"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post has been successfully destroyed"
      redirect_to posts_path
    else
      flash[:error] = "Unable to delete post"
      redirect_to @post, warning: "Unable to delete post"
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
