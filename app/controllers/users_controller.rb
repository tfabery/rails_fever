class UsersController < ApplicationController
  def index
    helpers.current_user
    helpers.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Fever!"
      redirect_to '/'
    else
      flash[:alert] = "Please try again"
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_hash, :password_salt)
    end
end
