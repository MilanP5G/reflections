class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :home]

  def home
    if session[:user_id]
      redirect_to users_path
    end
  end

  def index
    @users = User.all
    @user = User.find_by(id: params[:id])
  end

  def new
    if !session[:user_id]
      @user = User.new
    else
      redirect_to users_path(@user)
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
    render :new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.owned_books
  end

  def settings
    
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
