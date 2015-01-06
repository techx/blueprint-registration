module ApplicationHelper

  def resource_name
    :hacker
  end

  def resource
    @resource ||= Hacker.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:hacker]
  end

end
