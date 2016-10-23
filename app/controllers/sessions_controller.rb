class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.activated == false
      flash[:alert] = 'Account not activated, unable to sign in.'
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password]) && @user.activated == true
      session[:auth_token] = @user.auth_token
      redirect_to user_path(@user), notice: 'Signed In'
    else
      flash[:alert] = 'Incorrect Credentials'
      redirect_to root_path
    end
  end

  def destroy

  end

end
