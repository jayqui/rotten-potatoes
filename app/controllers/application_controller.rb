class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end
  
  def this_user
    User.find_by(id: session[:user_id])
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

  def authorized?(movie, reviewer)
    movie.authorized_reviewer == reviewer
  end

end
