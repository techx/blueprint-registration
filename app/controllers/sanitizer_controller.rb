class SanitizerController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  def create
    result = super
    if !resource.invalid?
      resource.team_code = SecureRandom.hex
      resource.save!
      HackerMailer.welcome(resource).deliver unless resource.invalid?
    end
    result
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :mentor) }
    end
end
