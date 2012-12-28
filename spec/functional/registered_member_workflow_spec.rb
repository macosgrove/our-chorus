require 'functional/functional_helper'


describe 'registered member workflow', :type => :request do

  let!(:member) {FactoryGirl.create(:full_member, username: 'member', password: 'password', password_confirmation: 'password')}

  before do
    sign_in_with('member', 'password')
  end

  context 'the member has logged in' do
    it 'should show navigational links' do
      pending 'Change your Details is not working'
      page.should_not have_link 'Our Vision'
      page.should_not have_link 'Our Values'
      page.should_not have_link 'Our Music'
      page.should_not have_link 'Our Members'
      page.should_not have_link 'How We Operate'
      page.should_not have_link 'Sign in'
      page.should have_link 'Sign out'
      page.should_not have_link 'Join us!'
      page.should have_link 'Change your Details'
    end
  end
end
