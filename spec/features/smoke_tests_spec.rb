require 'features/functional_helper'


describe 'the Production site', :type => :request do
  it 'should be alive' do
    visit 'http://www.our-chorus.org'
    should_be_on 'our-chorus'
    page.should have_content 'Our Vision'
  end
end