require 'functional/functional_helper'


describe 'founder workflow', :type => :request do

  context 'the founder has not logged in' do
    it "should allow the founder to sign in" do
      visit user_session_path
      fill_in 'Login', with: "macosgrove"
      fill_in 'Password', with: "ourchorusfounder"
      click_button 'Sign in'
      page.should have_content 'Signed in successfully.'
      page.should have_content 'Welcome'
    end
  end
end