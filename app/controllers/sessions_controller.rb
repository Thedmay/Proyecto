class SessionsController < Devise::SessionsController

  private

  def require_no_authentication
    assert_is_devise_resource!
    return unless is_navigational_format?
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
      args = no_input.dup.push scope: resource_name
      warden.authenticate?(*args)
    else
      warden.authenticated?(resource_name)
    end

    if authenticated && resource = warden.user(resource_name)
      flash[:alert] = I18n.t("devise.failure.already_authenticated")
      redirect_to YOUR_PATH_HERE
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    true
    #stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end

end