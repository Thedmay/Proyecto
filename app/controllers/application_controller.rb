class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  alias_method :current_user, :current_usuario
  devise_group :entity, contains: [:usuario, :company]
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nombre)
    if request.original_url.include? "usuarios"
      devise_parameter_sanitizer.for(:sign_up).push(:permission_level)
    else
      devise_parameter_sanitizer.for(:sign_up).push(:rut)
      devise_parameter_sanitizer.for(:sign_up).push(:telefono)
      devise_parameter_sanitizer.for(:sign_up).push(:direccion) 
      devise_parameter_sanitizer.for(:sign_up).push(:razon_social) 
      devise_parameter_sanitizer.for(:sign_up).push(:giro_comercial_id) 
    end
  	#devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre,:email,:password,:password_confirmation, :permission_level])
  end

end
