require "spec_helper"

def validate_welcome_email_content(text)
  text.should match(/Dear James/)
  text.should match(/Thanks for registering for Our Chorus at www.our-chorus.org!/)
  text.should match(/Please spend a few moments to complete our RSVP survey/)
  text.should match(/Mary-Anne Cosgrove/)
  text.should match(/Our Chorus Founder/)
end

describe UserMailer do

  describe "#welcome_email" do

    it "should send welcome email when new user is created" do
      FactoryGirl.create(:user,
                         first_name: 'James', last_name: 'Walker', email: 'james@example.com')

      email = ActionMailer::Base.deliveries.last
      email.should_not be_nil
      email.to.should eq(['james@example.com'])
      email.subject.should eq("Welcome to Our Chorus!")

      email.multipart?.should be true
      #puts "Welcome email - html"
      #puts email.html_part.body
      #puts "*********************************"
      #puts "Welcome email - text"
      #puts email.text_part.body
      #puts "*********************************"
      validate_welcome_email_content(email.text_part.body)
      validate_welcome_email_content(email.html_part.body)
    end
  end
end