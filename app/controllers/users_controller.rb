class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: 'User created'
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def show
    @sponsors = @event.sponsors
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user ||= User.find_by_auth_token session[:auth_token]
  end

  def find_event
    @event ||= Event.find_by_aasm_state 'current'
    @event.where('start_date > ?, aasm_state == ?', Date.today, 'published').first if @event == nil
  end

end
