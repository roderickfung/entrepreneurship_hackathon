class Users::EventsController < LoggedinController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to users_event_path(@event), notice: 'Event created'
    else
      flash[:alert] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    @upcoming_events = Event.where('start_date > ? OR aasm_state != ?', Date.today, 'canceled')
    @past_events = Event.where('start_date < ? OR aasm_state == ?', Date.today, 'completed')
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :aasm_state)
  end
end
