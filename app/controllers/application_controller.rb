class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?, only:[:create]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :icon_name])
  end
  include ApplicationHelper
end
