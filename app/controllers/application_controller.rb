class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation bio])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_updates, keys: %i[name email password password_confirmation bio])
  end
end
