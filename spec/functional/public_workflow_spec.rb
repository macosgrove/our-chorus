require 'functional/functional_helper'


describe 'public workflow', :type => :request do

  context 'the person has not registered' do
    it "should redirect to sign-in page after failed sign-in" do
      visit user_session_path
      fill_in 'Login', with: "wrong"
      fill_in 'Password', with: "wrong"
      click_button 'Sign in'
      should_be_on 'users/sign_in'
      page.should have_content 'Invalid login or password.'
    end

    it "should allow a potential member to register" do
      visit new_user_registration_path
      fill_in 'Email', with: 'new@example.com'
      fill_in 'Username', with: 'newmember'
      fill_in 'Password', with: 'mypassword'
      fill_in 'Password confirmation' , with: 'mypassword'
      fill_in 'About me', with: 'I love singing.'
      fill_in 'First name', with: 'Maisie'
      fill_in 'Last name', with: 'Jones'
      click_button 'Register'
      page.should have_content 'Welcome! You have registered successfully.'
    end
  end

end
