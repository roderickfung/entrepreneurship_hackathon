class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :new_participant

  def user_signed_in?
    session[:auth_token].present?
  end
  helper_method :user_signed_in?

  def current_user
    if user_signed_in?
      @current_user ||= User.find_by_auth_token(session[:auth_token]) if session[:auth_token]
    end
  end
  helper_method :current_userr

  def authenticate_user!
    if user_signed_in? == false
      flash[:alert] = 'Sign in required'
      redirect_to root_path
    end
  end

  def current_event
    @event ||= Event.find_by_aasm_state 'current'
    if @event.present? == false
      @event = Event.where('aasm_state = ? AND start_date > ?', 'published', Date.today).first
    end
  end
  helper_method :current_event

  def new_participant
    @participant ||= Participant.new
  end

end
