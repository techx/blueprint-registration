class SanitizerController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  def create
    super
    @user.team_code = SecureRandom.hex
    @user.save!
    HackerMailer.welcome(@user).deliver unless @user.invalid?
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :mentor) }
    end
end
