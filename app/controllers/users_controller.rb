class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :home]

  def home
  end

  def index
    @users = User.all
    @user = User.find_by(id: params[:id])
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
    "redirect_to(new_user_path) and return"
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end


end
