class ResetController < Devise::PasswordsController

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      flash[:notice] = "We have sent password reset instructions to the address you provided."
      redirect_to root_url
    else
      flash[:alert] = resource.errors.full_messages.sample
      redirect_to start_password_reset_path
    end
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_flashing_format?
      sign_in(resource_name, resource)
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      flash[:alert] = resource.errors.full_messages.sample
      redirect_to change_hacker_password_url(reset_password_token: resource_params['reset_password_token'])
    end
  end

  def after_resetting_password_path_for(resource)
    root_path
  end

end
