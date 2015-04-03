class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    response do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = @user.id
    if @post.save
      flash[:notice] = "Comment posted."
      response do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      flash[:alert] = "Comment failed to post."
      redirect_to post_path(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated."
      response do |format|
        format.html { redirect_to post_path(@post) }
        format.js
      end
    else
      flash[:alert] = "Comment failed to update."
      redirect_to post_path(@post)
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted."
    redirect_to post_path(@post)
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
