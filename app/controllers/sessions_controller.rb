class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if User.find_by(username: params[:username])
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to users_path
       end
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
