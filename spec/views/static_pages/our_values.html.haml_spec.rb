require 'spec_helper'

describe "static_pages/our_values.html.haml" do
  it "should render Our Values" do
    render
    rendered.should have_selector('li', text: 'We all have an equal say')
  end
end
