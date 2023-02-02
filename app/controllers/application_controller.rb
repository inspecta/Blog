class ApplicationController < ActionController::Base
  # Set up user authentication
  before_action :authenticate_user!

  # Add addtional parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Customize redirect hooks
  def after_sign_in_path_for(_resource)
    users_url
  end

  # Permit addtional parameters (@lazy)
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name bio email photo password confirm_password]
    )
    devise_parameter_sanitizer.permit(
      :sign_in, keys: %i[email password]
    )
  end
end
