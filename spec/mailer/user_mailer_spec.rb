require "spec_helper"

def validate_welcome_email_content(text)
  text.should match(/Hi James/)
  text.should match(/Thanks for registering for Our Chorus/)
  text.should match(/Mary-Anne Cosgrove/)
  text.should match(/Our Chorus Founder/)
end

describe UserMailer do

  describe "#welcome_email" do

    it "should send welcome email when new user is created" do
      #disable for now
      #email_addr = Faker::Internet.email
      #ActionMailer::Base.deliveries.clear
      #FactoryGirl.create(:user,
      #                   first_name: 'James', last_name: 'Walker', email: email_addr, send_emails: true)
      #
      #ActionMailer::Base.deliveries.size.should be(2)
      #email = ActionMailer::Base.deliveries.first
      #email.should_not be_nil
      #email.to.should eq([email_addr])
      #email.subject.should eq("Welcome to Our Chorus!")
      #
      #email.multipart?.should be true
      #puts "Welcome email - html"
      #puts email.html_part.body
      #puts "*********************************"
      #puts "Welcome email - text"
      #puts email.text_part.body
      #puts "*********************************"
      #validate_welcome_email_content(email.text_part.body)
      #validate_welcome_email_content(email.html_part.body)
    end
    it "should send notification email when new user is created" do
      email_addr = Faker::Internet.email
      ActionMailer::Base.deliveries.clear
      FactoryGirl.create(:user,
                         first_name: 'James', last_name: 'Walker', email: email_addr, send_emails: true)

      ActionMailer::Base.deliveries.size.should be(1)
      email = ActionMailer::Base.deliveries.first
      email.should_not be_nil
      email.to.should eq(['ourchorus.info@gmail.com'])
      email.subject.should eq("We have a new prospective member!")

      email.multipart?.should be false
      #puts "Notification email - html"
      #puts email.body
      email.body.should match(/Name: James Walker/)
      email.body.should match(/Email: #{email_addr}/)
    end
  end
end