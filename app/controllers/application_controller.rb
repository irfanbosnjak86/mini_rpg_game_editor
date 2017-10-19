class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # For devise parameters username
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # For devise parameters username
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
