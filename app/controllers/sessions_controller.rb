class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.activated == false
      flash[:alert] = 'Account not activated, unable to sign in.'
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password]) && @user.activated == true
      sessions[:user] = @user.auth_token
      redirect_to root_path, notice: 'Signed In'
    else
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def destroy

  end

end
