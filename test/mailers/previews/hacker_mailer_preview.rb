# Preview all emails at http://localhost:3000/rails/mailers/hacker_mailer
class HackerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hacker_mailer/welcome
  def welcome
    HackerMailer.welcome
  end

end
