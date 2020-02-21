class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Вы вошли в систему'
    else
      redirect_to login_path, notice: 'Данные введены неверно'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  def login
  end

end
