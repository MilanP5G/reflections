class UsersController < ApplicationController

  def home
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    end
    "redirect_to(new_user_path) and return"
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end
