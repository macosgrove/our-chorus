require 'features/functional_helper'


describe 'registered member workflow', :type => :request do

  let!(:member) {FactoryGirl.create(:full_member, username: 'member', password: 'password', password_confirmation: 'password')}

  before do
    sign_in_with('member', 'password')
  end

  context 'the member has logged in' do
    it 'should show navigational links' do
      page.should have_link 'Our Vision'
      page.should have_link 'Our Values'
      page.should_not have_link 'Our Music'
      page.should have_link 'Our Members'
      page.should_not have_link 'Our Practices'
      page.should_not have_link 'Sign in'
      page.should have_link 'Sign out'
      page.should_not have_link 'Join us!'
      page.should have_link 'Change my Details'
      page.should have_link 'Course Materials'
    end

    it 'should allow access to the course materials page' do
      visit static_pages_course_materials_path
      page.should have_text 'Grow Your Voice / Grow Your Group - Course Materials'
    end
  end
end
