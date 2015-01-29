class AdminController < ApplicationController

  layout 'admin'

  before_filter :admin_login!, except: [:root, :login]
  before_filter :stay_logged_in!, only: [:root, :login]

  def root
  end

  def login
    if params[:key] == Admin::KEY
      start_session
      redirect_to admin_hackers_path
    else
      redirect_to admin_login_path, flash: { error: true }
    end
  end

  def logout
    reset_session
    redirect_to admin_login_path
  end

  def hackers
    @hackers = Hacker.where(mentor: false, status: 1..1000000).where(sanitized_search_params).order("LOWER(school)")
  end

  def mentors
    @mentors = Hacker.where(mentor: true, status: 1..10000000).where(sanitized_search_params).order(:year)
  end

  def view
    @user = Hacker.where(id: params[:id]).take
  end

  def update
    hacker = Hacker.where(id: params[:id]).take
    if hacker.update_attributes(hacker_params)
      flash[:notice] = "The hacker/mentor was saved successfully."
    else
      flash[:alert] = "There was an error saving the hacker."
    end
    redirect_to admin_view_user_path(params[:id])
  end

  protected

  def sanitized_search_params
    {}
  end

  def hacker_params
    params.require(:hacker).permit(:mentor, :status)
  end

  def admin_logged_in?
    session[:key] == Admin::KEY
  end

  def admin_login!
    redirect_to admin_login_path unless admin_logged_in?
  end

  def stay_logged_in!
    redirect_to admin_hackers_path if admin_logged_in?
  end

  def start_session
    reset_session
    session[:key] = params[:key]
  end

end
