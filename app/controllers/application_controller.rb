class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :email_confirmation, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:edit_user_password) { |u| u.permit(:password, :password_confirmation, :current_password)}
  end
end
