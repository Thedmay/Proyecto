class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  alias_method :current_user, :current_usuario

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up).push(:nombre) 
  	devise_parameter_sanitizer.for(:sign_up).push(:permission_level) 
  	#devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:email,:password,:password_confirmation, :permission_level])
  end

end
