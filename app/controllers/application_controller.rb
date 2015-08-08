class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :mailbox

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login (redirect_path = login_path)
    redirect_to redirect_path unless is_authenticated?
  end

  def is_authenticated?
    !!session[:user_id]
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

end
