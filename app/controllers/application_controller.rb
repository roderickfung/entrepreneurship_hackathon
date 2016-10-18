class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def user_signed_in?
    sessions[:auth_token].present?
  end
  helper_method :user_signed_in?

  def current_user
    if user_signed_in?
      @current_user ||= User.find_by_auth_token(sessions[:auth_token]) if sessions[:auth_token]
    end
  end

  def authenticate_user!
    if user_signed_in? == false
      flash[:alert] = 'Sign in required'
      redirect_to root_path
    end
  end
end
