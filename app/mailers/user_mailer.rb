class UserMailer < ActionMailer::Base

  default from: 'ourchorus.info@gmail.com'

  def welcome_email(member)
    @member = member
    puts "Sending welcome email to #{member.full_name}"
    mail(:to => member.email, :subject => 'Welcome to Our Chorus!')
  end

  def notification_email(member)
    @member = member
    puts "Sending notification email for #{member.full_name}"
    mail(:to => 'ourchorus.info@gmail.com', :subject => 'We have a new prospective member!')
  end

end
