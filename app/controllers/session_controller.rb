class SessionController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    auth_options = { :recall => 'registration#home', :scope => :hacker }
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

end
