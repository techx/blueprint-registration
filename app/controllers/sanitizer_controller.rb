class SanitizerController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  def create
    super
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :mentor) }
    end
end
