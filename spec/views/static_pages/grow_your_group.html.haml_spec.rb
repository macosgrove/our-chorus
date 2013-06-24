require 'spec_helper'

describe "static_pages/grow_your_group.html.haml" do
  it "should render Grow Your Group" do
    render
    rendered.should have_selector('h1', text: 'Grow Your Group')
  end
end
