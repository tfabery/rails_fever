class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    helpers.current_post
    @comment = Comment.find(params[:post_id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    helpers.current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:notice] = "Comment has been added"
      respond_to do |format|
        format.html { redirect_to user_post_path(@post.user, @post) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    flash[:notice] = "Comment has been removed"
    redirect_to root_path
  end

private
  def comment_params
    params.require(:comment).permit(:content, :commentable_id)
  end
end
