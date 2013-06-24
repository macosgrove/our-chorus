require 'spec_helper'

describe "static_pages/contact_us.html.haml" do
  it "should render Contact Us" do
    render
    rendered.should have_selector('h1', text: 'Contact Us')
  end
end
