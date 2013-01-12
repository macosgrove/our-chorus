require 'features/functional_helper'

describe 'founder workflow', :type => :request do

  context 'the founder has not logged in' do
    it "should allow the founder to sign in" do
      visit user_session_path
      fill_in 'Login', with: "macosgrove"
      fill_in 'Password', with: "ourchorusfounder"
      click_button 'Sign in'
      page.should have_content 'Signed in successfully.'
      page.should have_content 'Come to the Inception of Our Chorus'
    end
  end

  context 'the founder has logged in' do
    before do
      sign_in_with('macosgrove', 'ourchorusfounder')
    end

    it 'should show navigational links' do
      page.should have_link 'Our Vision'
      page.should have_link 'Our Values'
      page.should have_link 'Our Music'
      page.should have_link 'Our Members'
      page.should have_link 'How we Operate'
      page.should have_link 'Sign out'
      page.should_not have_link 'Sign in'
      page.should_not have_link 'Join us!'
      page.should have_link 'Change your Details'
    end
  end
end