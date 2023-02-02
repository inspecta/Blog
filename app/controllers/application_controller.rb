class ApplicationController < ActionController::Base
  # Set up user authentication
  before_action :authenticate_user!

  # Add addtional parameters
  before_action :configure_permitted_parameters, if: :devise_controller?


end
