class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    return redirect_to "/" unless current_user
  end



end
