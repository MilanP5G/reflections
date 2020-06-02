class UsersController < ApplicationController

  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end
