class RegistrationController < ApplicationController

  before_filter :home_if_not_logged_in, except: [:home, :hacker_sign_up, :mentor_sign_up]
  before_filter :status_if_logged_in, only: [:home, :hacker_sign_up, :mentor_sign_up]
  before_filter :status_unless_team_available, only: [:team_view, :team_leave, :team_join]
  before_filter :application_if_not_applied, only: [:status]

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
    redirect_to apply_url if current_hacker.status == 0
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
  def apply

  end

  #update the user's application
  def update
    current_hacker.update_attributes(hacker_params)
    current_hacker.availability = params["hacker"]["availability"] || []
    current_hacker.interests = params["hacker"]["interests"] || []
    current_hacker.status = 1 if current_hacker.status == 0
    current_hacker.save!
    flash[:notice] = "Success! Changes saved."
    redirect_to status_path
  end

  def team_view
    @team_hackers = Hacker.where(:team_code => current_hacker.team_code)
  end

  def team_leave
    current_hacker.team_code = TeamCode.generate!
    current_hacker.save!
    flash[:notice] = "Left the team."
    redirect_to team_url
  end

  def team_join
    hex = hacker_params["team_code"] || TeamCode.generate!
    status = TeamCode.validate_code(hex)
    if status[:valid]
      current_hacker.team_code = hex
      current_hacker.save!
      flash[:notice] = status[:message]
    else
      flash[:alert] = status[:message]
    end
    redirect_to team_url
  end

  private

  def hacker_params
    params.require(:hacker).permit(:mentor, :first_name, :last_name, :phone, :school, :year, :emergency_info, :availability, :shirt_size, :dietary_restrictions, :interests, :team_code)
  end

end
