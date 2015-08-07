class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path unless is_authenticated?
  end

  def is_authenticated?
    !!session[:user_id]
  end

end
