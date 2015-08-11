module ApplicationHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def active_page(active_page)
    @active == active_page ? 'active' : ''
  end

end
