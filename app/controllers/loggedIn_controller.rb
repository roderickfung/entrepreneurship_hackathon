class LoggedinController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  private

  def find_user
    @user ||= User.find_by_auth_token session[:auth_token]
  end

end
