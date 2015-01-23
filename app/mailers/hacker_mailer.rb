class HackerMailer < Devise::Mailer
  default from: "blueprint@hackmit.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hacker_mailer.welcome.subject
  #
  def welcome(user)
    mail(to: user.email, subject: "[Blueprint] Thanks for registering!") do |format|
      template = user.mentor? ? 'welcome_mentor' : 'welcome_hacker'
      format.html { render template }
      format.text { render template }
    end
  end

end
