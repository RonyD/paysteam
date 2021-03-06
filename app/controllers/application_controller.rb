class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_company

  private
  def authenticate
    if session[:user_id].nil?
      redirect_to login_path
    end
  end

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_company
    current_company ||= current_user.company if current_user
  end
end
