class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # Allow unauthenticated users access only to controllers with:
  # skip_before_filter :require_login
  before_filter :require_login

  private

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end
