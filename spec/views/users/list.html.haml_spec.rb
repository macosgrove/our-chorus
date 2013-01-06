require 'spec_helper'

describe "users/list" do
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
    view.stub(:current_user) { logged_in_user }
    render
  end

  it "renders a list of users" do
    rendered.should_not have_selector('p', text: "Email")
    rendered.should have_selector('p', text: "This")
    rendered.should have_selector('p', text: "Is Me")
    rendered.should have_selector('p', text: "Someone")
    rendered.should have_selector('p', text: "Else")
    rendered.should_not have_selector('p', text: "1234")
    rendered.should_not have_selector('p', text: "5678")
    rendered.should_not have_selector('p', text: "password")
    rendered.should have_selector('p', text: "I <3 singing")
    rendered.should have_selector('p', text: "I am special")
  end
end
