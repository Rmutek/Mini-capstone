class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end 
  helper_method :current_user

  def authenticate_user! 
    flash[:warning] = "Please login"
    redirect_to "/login" unless current_user
  end 

  def authenticate_admin!
    unless current_user && current_user.admin 
      redirect_to "/"
      return 
    end
  end 
  
end
