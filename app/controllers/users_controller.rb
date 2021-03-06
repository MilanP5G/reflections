class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :home]
  before_action :set_user, only: [:show, :edit, :settings, :destroy]

  def home
    if session[:user_id]
      redirect_to users_path
    end
  end

  def index
    @users = User.with_reflections
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
    access_self
  end

  def edit
    access_self
  end

  def update
    if @user = current_user
      if @user.update_attributes(user_params)
       redirect_to account_settings_path(@user.id)
      else
       render :edit
      end
    end
  end

  def destroy
   if current_user.id == @user.id
      @user.destroy
      session.delete :user_id
      redirect_to root_path
   end
 end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def access_self
    if @user = current_user
      @user
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
