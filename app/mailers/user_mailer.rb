class UserMailer < ActionMailer::Base

  default from: "ourchorus.info@gmail.com"

  def welcome_email(member)
    @member = member
    mail(:to => member.email, :subject => "Welcome to Our Chorus!")
  end

end
