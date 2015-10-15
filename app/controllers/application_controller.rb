class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    flash.now[:notice] = "Access denied!"
    redirect_to main_app.root_path, :alert => exception.message
  end
  check_authorization unless: :devise_controller?

end
