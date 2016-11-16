class ParticipantsController < ApplicationController

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new participant_params
    @participant.event = current_event
    if @participant.save
      redirect_to 'https://www.eventbrite.com/e/startup-hacks-2017-business-startup-hackathon-for-youth-tickets-27669172239?ref=eweb'
    else
      flash[alert] = @participant.errors.full_messages.to_sentence
      redirect_to root_path
      # redirect_to 'https://www.eventbrite.com/e/startup-hacks-2017-business-startup-hackathon-for-youth-tickets-27669172239?ref=eweb'
    end

  end

  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :email)
  end

end
