class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  private

  def set_current_user
    Current.user = User.find_by(id: session[:user_id])
  end


end
