class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
 	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def require_user
    if !logged_in?
      flash[:error] = "Please log in to view this section"
 	    redirect_to root_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def redirect_if_logged_in
    # if the session user id exists, find the user from that id and if they exist, redirect to their calendar.
    if logged_in?
      redirect_to user_events_path(user_id: @current_user.id)
    end
  end
end
