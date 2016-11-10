class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
    redirect_to posts_path if current_user
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    accessible = [ :username, :email ]
    accessible << [ :password, :password_confirmation ] unless prams[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
