class HomeController < ApplicationController
  before_action :user_check
  before_action :new_participant

  def index
    # @event = Event.find_by_aasm_state 'current'
    # @event = Event.where('aasm_state = ? AND start_date > ?', 'published', Date.today).first if @event == nil
    # @sponsors = @event.sponsors
    # @speakers = @event.speakers
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

  def new_participant
    @participant ||= Participant.new
  end

end
