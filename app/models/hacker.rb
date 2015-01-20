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

  def full_status
    {
      0 => {
        impression: "negative",
        title: "Submit your application!",
        text: "You've created your account, but you haven't submitted anything yet! Please complete your application to be considered for admission.",
        subtext: ""
      },
      1 => {
        impression: "neutral",
        title: "Application Submitted!",
        text: "Your application has been submitted, but you can still edit it up until we release the first wave of decisions.",
        subtext: (mentor?) ? "" : "Don't forget to create a team if you have people in mind. We'll accept or deny teams as a whole."
      }
    }[status]
  end

  def get_error
    error = false
    error = 'You must answer all short response questions.' if desire.length == 0 or experience.length == 0
    error = 'You must select a T-Shirt size.' unless shirt_size
    error = 'You must be able to come at least one of the days' if availability == []
    unless phone.match(/\A[+#*\(\)\[\]]*([0-9][ ext+-pw#*\(\)\[\]]*){6,45}\z/)
      error = "Phone number is not valid."
    end
    error = "School name is too long." if school.length > 200
    error = "School name is too short." if school.length < 1
    error = "Last name is too short." if last_name.length < 1
    error = "Last name is too long." if last_name.length > 200
    error = "First name is too long." if first_name.length > 200
    error = "First name is too short." if first_name.length < 1
    error
  end

end
