class HackerMailer < Devise::Mailer
  default from: "blueprint@hackmit.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hacker_mailer.welcome.subject
  #
  def welcome(user)
    mail to: user.email, subject: "[Blueprint] Thanks for registering!"
  end

end
