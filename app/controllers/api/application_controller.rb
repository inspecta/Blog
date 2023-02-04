class ApplicationController < ActionController::API
  protect from forgery with: :null_session
end
