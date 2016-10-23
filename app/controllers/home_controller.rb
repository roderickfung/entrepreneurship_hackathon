class HomeController < ApplicationController
  before_action :find_event

  def index
    @sponsors = @event.sponsors
    @speakers = @event.speakers
    @participant = Participant.new
  end

  def about

  end

  def contact

  end

  def resources

  end

  private

  def find_event
    @event ||= Event.find_by_aasm_state 'current'
    @event ||= Event.where('aasm_state == ?, start_date > ?', 'published', Date.today).first
  end
end
