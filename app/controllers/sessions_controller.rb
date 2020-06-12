class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    if User.find_by(username: params[:username])
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to users_path
          return
       else
         @user.errors.add(:password, "Invalid password!")
       end
    end
    render :new
  end

  def facebook_callback
    @user = User.find_or_create_by(username: auth['info']['name']) do | u |
      u.email = auth['info']['email']
      u.password = "password"
    end
      if @user.save || @user.id
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
