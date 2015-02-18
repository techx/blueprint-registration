class RegistrationController < ApplicationController

  before_filter :home_if_not_logged_in, except: [:home, :hacker_sign_up, :mentor_sign_up]
  before_filter :status_if_logged_in, only: [:home, :hacker_sign_up, :mentor_sign_up]
  before_filter :status_unless_team_available, only: [:team_view, :team_leave, :team_join]
  before_filter :application_if_not_applied, only: [:status]
  before_filter :status_if_applied, only: [:team_view, :info]

  #### FILTERS ####

  def status_if_logged_in
    redirect_to status_url if hacker_signed_in?
  end

  def home_if_not_logged_in
    redirect_to root_url unless hacker_signed_in?
  end

  def status_unless_team_available
    redirect_to status_url unless current_hacker.team_available?
  end

  def application_if_not_applied
    redirect_to info_url if current_hacker.status <= 4
  end

  def status_if_applied
    redirect_to status_url if current_hacker.status > 4
  end

  #### VIEW METHODS ####
  #root url, should redirect if logged in
  def home

  end

  #sign up for mentors, if not logged in
  def hacker_sign_up

  end

  #sign up for mentors, if not logged in
  def mentor_sign_up

  end

  #show current application status
  def status

  end

  #show application page
  def info

  end

  def update_info
    current_hacker.assign_attributes(hacker_params)
    current_hacker.emergency_info = params["hacker"]["emergency_info"]
    if not_allowed_empty
      flash[:alert] = "You must fill in all fields"
      render "info"
    else
      current_hacker.status += 3 if current_hacker.status <= 4
      current_hacker.save!
      flash[:notice] = "Success! Your form has been saved"
      redirect_to status_url
    end
  end

  def team_view
    @team_hackers = Hacker.where(:team_code => current_hacker.team_code)
  end

  private

  def not_allowed_empty
    (hacker_params.values.include?("") or (current_hacker.emergency_info.try(:values) || []).include?("")) and (hacker_params["attending"] == "true" or hacker_params["attending_day1"] == "true")
  end

  def hacker_params
    params.require(:hacker).permit(:attending_day1, :attending, :laptop_type, :phone_type, :experience_level, :first_choice, :second_choice, :third_choice, :emergency_info, :orientation, :judging)
  end

end
