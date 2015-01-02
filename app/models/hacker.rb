class Hacker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessor :first_name, :last_name, :phone, :school, :year, :emergency_info, :availability, :shirt_size, :dietary_restrictions, :interests

end
