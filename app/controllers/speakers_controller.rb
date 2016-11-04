class SpeakersController < ApplicationController
  before_action :find_event, only: [:index]
  before_action :find_speaker, only: [:show]

  def index
    @speakers = @event.speakers
  end

  def show

  end

  private

  def find_event
    @event ||= Event.find_by_aasm_state 'current'
    if @event == nil
      @event ||= Event.where('aasm_state = ? AND start_date > ?', 'published', Date.today).first
    end
    @event ||= Event.last if @event == nil
  end

  def find_speaker
    @speaker = Speaker.find params[:id]
  end

end
