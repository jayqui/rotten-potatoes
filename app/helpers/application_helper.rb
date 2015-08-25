module ApplicationHelper
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def current_user_id
    session[:user_id]
  end

  def logged_in?
    session[:user_id] != nil
  end

  def login_user(user)
    session[:user_id] = user.id
  end

  def logout_user
    session[:user_id] = nil
  end

  def is_admin?
    logged_in? && current_user.is_admin == true
  end

  def is_pro?
    logged_in? && current_user.has_pro_permissions == true
  end
end
