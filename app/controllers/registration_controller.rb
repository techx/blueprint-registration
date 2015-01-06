class RegistrationController < ApplicationController

	before_filter :redirect_to_home_if_not_logged_in, except: [:home, :hacker_sign_up, :mentor_sign_up]
	before_filter :redirect_to_status_if_logged_in, only: [:home, :hacker_sign_up, :mentor_sign_up]

	#### FILTERS ####

	def redirect_to_status_if_logged_in
		redirect_to status_url if hacker_signed_in?
	end

	def redirect_to_home_if_not_logged_in
		redirect_to root_url unless hacker_signed_in?
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
		current_hacker.update_attributes(params[:hacker])
		current_hacker.status = 1 if current_hacker.status == 0
		redirect_to status_path
	end


end
