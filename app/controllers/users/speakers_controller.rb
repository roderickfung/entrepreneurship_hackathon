class Users::SpeakersController < LoggedinController
  before_action :find_speakers, except: [:new, :create]
  before_action :find_event, only: [:new, :create]

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new speaker_params

  end

  def edit

  end

  def update
    if @speaker.update speaker_params
      redirect_to speaker_path(@speaker), notice: 'Updated'
    else
      flash[:alert] = @speaker.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @speaker.destroy
    redirect_to user_path(@user)
  end

  private

  def find_speakers
    @speaker ||= Speaker.find params[:id]
  end

  def speaker_params
    params.require(:speaker).permit(:first_name, :last_name, :title, :email, :description, :twitter, :linkedin, :website, :image)
  end

end
