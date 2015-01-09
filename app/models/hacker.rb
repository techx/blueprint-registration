class Hacker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def application_complete?
    first_name and last_name and phone and school and shirt_size
  end

  def team_available?
    application_complete? and not mentor?
  end

  def name
    first_name + " " + last_name
  end

end
