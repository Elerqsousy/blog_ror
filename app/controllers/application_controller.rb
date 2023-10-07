class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

    # Catch all CanCan errors and alert the user of the exception
    rescue_from CanCan::AccessDenied do | exception |
      redirect_to root_url, alert: exception.message
    end
  

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:edit_user_password) do |u|
      u.permit(:password, :password_confirmation, :current_password)
    end
  end
end
