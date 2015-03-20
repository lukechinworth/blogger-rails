class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post successfully added."
      redirect_to posts_path
    else
      flash[:alert] = "Post failed to be created."
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post failed to be updated."
      redirect_to edit_post_path(@post)
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
