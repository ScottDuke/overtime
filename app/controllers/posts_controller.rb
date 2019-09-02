class PostsController < ApplicationController
  before_action :set_post, only: %w(show edit update destroy)

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        flash[:success] = "Post has been created successfully"
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.json do
          render json: {
            errors: @post.errors.full_messages,
            flash_message: "Could not create post",
          },
          status: :unprocessable_entity
        end

        format.html { render :new }
      end
    end
  end

  def show; end

  def edit
    authorize @post
  end

  def update
    authorize @post

    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = "Post has been updated successfully"
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.json do
          render json: {
            errors: @post.errors.full_messages,
            flash_message: "Could not update post",
          },
          status: :unprocessable_entity
        end
        format.html { render :edit }
      end
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
    params.require(:post).permit(:date, :rationale, :state_event, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
