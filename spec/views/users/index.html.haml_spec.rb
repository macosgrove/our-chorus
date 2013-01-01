require 'spec_helper'

describe "users/index" do
  before(:each) do
    logged_in_user = stub_model(User,
                            :email => "Email",
                            :password => "Password",
                            :first_name => "This",
                            :last_name => "Is Me",
                            :mobile => "1234",
                            :about_me => "I <3 singing"
    )
    assign(:users, [
        logged_in_user,
        stub_model(User,
                   :email => "Email",
                   :password => "Password",
                   :first_name => "Someone",
                   :last_name => "Else",
                   :mobile => "5678",
                   :about_me => "I am special"
        )
    ])
    view.stub(:our_user) { logged_in_user }
    render
  end

  it "renders a list of users" do
    rendered.should have_selector('table tr td', text: "This")
    rendered.should have_selector('table tr td', text: "Is Me")
    rendered.should have_selector('table tr td', text: "Someone")
    rendered.should have_selector('table tr td', text: "Else")
    rendered.should have_selector('table tr td', text: "1234")
    rendered.should have_selector('table tr td', text: "5678")
    rendered.should have_selector('table tr td', text: "I <3 singing")
    rendered.should have_selector('table tr td', text: "I am special")
  end

  it "should remove the link from the Destroy on the currently logged in user" do
    rendered.should have_selector('table tr td a', text: 'Destroy', count: 1)
    rendered.should have_selector('table tr td', text: 'Destroy', count: 1)
  end
end
