class LoggedinController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :find_event

  private

  def find_user
    @user ||= User.find_by_auth_token session[:auth_token]
  end

  def find_event
    @event ||= Event.find_by_aasm_state 'current'
    flash[:alert] = 'This is not the upcoming event, please set an upcoming event.' if @event == nil
    @event = Event.where('start_date > ? AND aasm_state = ?', Date.today, 'published').first if @event == nil
    @event = Event.where('start_date > ?', Date.today).first if @event == nil
  end


end
