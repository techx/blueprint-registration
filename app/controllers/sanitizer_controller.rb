class SanitizerController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  def render(*args)

  end

  def create
    result = super
    if resource.valid?
      resource.team_code = TeamCode.generate!
      resource.save!
      HackerMailer.welcome(resource).deliver unless resource.invalid?
    end
    if resource.errors.any?
      flash[:alert] = resource.errors.full_messages.first
      if params['hacker']['mentor'] == '1'
        redirect_to mentor_sign_up_url
      else
        redirect_to hacker_sign_up_url
      end
    else
      redirect_to status_url
      result
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :mentor) }
    end
end
