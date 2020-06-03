class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
