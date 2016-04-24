class ApplicationController < ActionController::Base
  helper_method :user_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private
  # Authorizes only teachers
  def user_authorized
    current_user.teacher_id != nil
  end

end
