class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def resource
	  instance_variable_get(:"@#{resource_name}")
  end

  def resource_name
	  devise_mapping.name
  end
  def after_sign_in_path_for(resource)
	  request.env['schools_path']|| stored_location_for(resource) || root_url
  end
end
