class PostsController < ApplicationController
  before_action :find_commentable, only: [:show]
  def show
    helpers.current_user
    @post = @commentable
    @comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post has been added"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post has been removed"
    redirect_to root_path
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def find_commentable
    @commentable = Post.find_by_id(Comment.find_by_id(params[:comment_id]).post_id) if params[:comment_id]
    @commentable = Post.find_by_id(params[:id]) if params[:id]
  end
end
