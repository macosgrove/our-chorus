require 'spec_helper'

describe "static_pages/grow_your_voice.html.haml" do
  it "should render Grow Your Voice" do
    render
    rendered.should have_selector('h1', text: 'Grow Your Voice')
  end
end
