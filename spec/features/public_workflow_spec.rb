require 'features/functional_helper'


describe 'public workflow', :type => :request do

  context 'the person has not registered' do
    it "should redirect to sign-in page after failed sign-in" do
      visit user_session_path
      fill_in 'Login', with: "wrong"
      fill_in 'Password', with: "wrong"
      click_button 'Sign in'
      should_be_on 'users/sign_in'
      page.should have_content 'Invalid email or password.' #should say 'login' not 'email' WTF?
    end

    it "should allow a prospective member to register" do
      visit new_user_registration_path
      fill_in 'Email', with: 'new@example.com'
      fill_in 'Username', with: 'newmember'
      fill_in 'user_password', with: 'mypassword'
      fill_in 'user_password_confirmation' , with: 'mypassword'
      fill_in 'About me', with: 'I love singing.'
      fill_in 'First name', with: 'Samantha'
      fill_in 'Last name', with: 'Jones'
      uncheck 'user_checked_course'
      click_button 'Register'
      page.should have_content 'Welcome Samantha'
      page.should have_content  'You have successfully registered to join our chorus.'
      page.should have_content 'Rehearsals are every Wednesday from 7:30pm starting July 10 at Northbridge Uniting Church, Gunyah St, Northbridge'
      visit edit_user_registration_path
      should_be_on 'users/edit'
      page.should have_field('Email', with: 'new@example.com')
      page.should have_field('Username', with: 'newmember')
      page.should have_field('Password')
      page.should have_field('Password confirmation')
      page.should have_field('Current password')
      page.should have_field('About me', with: 'I love singing.')
      page.should have_field('First name', with: 'Samantha')
      page.should have_field('Last name', with: 'Jones')
      #page.should_not have_content('Course attendee')
      #page.should have_content('member')
    end

    it "should allow a guest to register to attend our course" do
      visit new_user_registration_path
      fill_in 'Email', with: 'new@example.com'
      fill_in 'Username', with: 'newmember'
      fill_in 'user_password', with: 'mypassword'
      fill_in 'user_password_confirmation' , with: 'mypassword'
      fill_in 'About me', with: 'I love singing.'
      fill_in 'First name', with: 'Tom'
      fill_in 'Last name', with: 'Jones'
      uncheck 'user_checked_membership'
      click_button 'Register'
      page.should have_content 'You have successfully registered to attend our course.'
      page.should have_content 'The course runs every Wednesday from 7:30pm starting July 17 at Northbridge Uniting Church, Gunyah St, Northbridge'
      visit edit_user_registration_path
      should_be_on 'users/edit'
      #page.should have_content('Course attendee')
      #page.should_not have_content('member')
    end

    it "should allow a prospective member to register and to attend our course" do
      visit new_user_registration_path
      fill_in 'Email', with: 'new@example.com'
      fill_in 'Username', with: 'newmember'
      fill_in 'user_password', with: 'mypassword'
      fill_in 'user_password_confirmation' , with: 'mypassword'
      fill_in 'About me', with: 'I love singing.'
      fill_in 'First name', with: 'Maisie'
      fill_in 'Last name', with: 'Macintosh'
      click_button 'Register'
      page.should have_content 'You have successfully registered to join our chorus and attend our course.'
      page.should have_content 'Rehearsals are every Wednesday from 7:30pm starting July 10 at Northbridge Uniting Church, Gunyah St, Northbridge'
      visit edit_user_registration_path
      should_be_on 'users/edit'
      #page.should_not have_content('Course attendee')
      #page.should have_content('member')
    end

    it 'should show navigational links' do
      visit root_path
      page.should have_link 'Our Vision'
      page.should have_link 'Our Values'
      page.should_not have_link 'Our Music'
      page.should have_link 'Our Members'
      page.should_not have_link 'Our Practices'
      page.should have_link 'Sign in'
      page.should_not have_link 'Sign out'
      page.should have_link 'Join us!'
      page.should_not have_link 'Change your Details'
    end
  end

end
