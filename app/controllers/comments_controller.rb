class CommentsController < ApplicationController
before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    helpers.current_user
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:notice] = "Comment has been added"
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
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
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable, @post = Comment.find_by_id(params[:comment_id]), Post.find_by_id(Comment.find_by_id(params[:comment_id]).commentable_id) if params[:comment_id]
    @commentable = @post = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
end
