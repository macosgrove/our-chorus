require 'spec_helper'

describe "devise/registrations/edit.html.haml" do
  before(:each) do
    @view.should_receive(:resource_name).twice.and_return('user')
    @view.should_receive(:resource).twice.and_return(assign(:user, stub_model(User,
      :email => "Email",
      :password => "Password",
      :first_name => "First Name",
      :last_name => "Last Name",
      :mobile => "Mobile"
    )))
    render
  end

  it "should render our privacy statement" do
    rendered.should have_selector('h3', text: 'View our Privacy Statement')
  end

end
