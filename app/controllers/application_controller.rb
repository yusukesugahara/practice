class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    abouts_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image])

    devise_parameter_sanitizer.permit(:invite,keys: [:email, :nickname])
    devise_parameter_sanitizer.permit(:accept_invitation,keys: [:password, :password_confirmation, :invitation_token, :nickname])

  end

end
