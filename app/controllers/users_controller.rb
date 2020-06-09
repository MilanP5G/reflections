class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :home]
  before_action :set_user, only: [:show, :destroy]

  def home
    if session[:user_id]
      redirect_to users_path
    end
  end

  def index
    @users = User.with_reflections
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
    else
      render :new
    end
  end

  def show
    @books = @user.owned_books
  end

  def settings

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
      if @user.update_attributes(user_params)
       redirect_to account_settings_path(@user.id)
      else
       render :edit
      end
  end

  def destroy
   if current_user.id == @user.id
      @user.destroy
      render :home
   end
 end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
