class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do
    flash[:alert] = 'Resource Not Found'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  protected

  def configure_permitted_parameters
           devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
           devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])
  end
end
