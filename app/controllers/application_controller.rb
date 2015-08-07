class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_current_user (user, redirect_path = login_path)
    redirect_to redirect_path if user != current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login (redirect_path = login_path)
    redirect_to redirect_path unless is_authenticated?
  end

  def is_authenticated?
    !!session[:user_id]
  end

end
