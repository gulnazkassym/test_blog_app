class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :password, :fullname))
    session[:user_id] = @user.id

    redirect_to root_path
  end

  def posts
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
end
