class HomeController < ApplicationController
  before_action :user_check

  def index
    # @event = Event.find_by_aasm_state 'current'
    # @event = Event.where('aasm_state = ? AND start_date > ?', 'published', Date.today).first if @event == nil
    # @sponsors = @event.sponsors
    # @speakers = @event.speakers
    @participant = Participant.new
  end

  def about

  end

  def contact

  end

  def resources

  end

  private

  def user_check
    @user ||= User.find_by_auth_token session[:auth_token] if user_signed_in?
  end

end
