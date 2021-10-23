class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!,except: [:top, :about, :show]

  before_action :configure_permitted_parameters, if: :devise_controller?

  Refile.secret_key = '9c593fdc88913eb859715738a4ecd5f7e5d115baf3de48024f910cfd3b7767d6a4fc67738f8dcdc0b2ce302fb4b8905f84ad19c45fe43d2773e37fa7ec4a8c0a'

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
