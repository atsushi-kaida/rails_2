class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    sign_up_params = [:name, :email, :password, :password_donfirmation, :icon_name]
    sign_up_params[icon_name] = default_user.jpg
    devise_parameter_sanitizer.permit(:sign_up,keys: sign_up_params)
  end
end
