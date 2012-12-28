require 'spec_helper'

describe "static_pages/our_vision.html.haml" do

    it "should render header links with Sign in and Join us! options" do
      render
      rendered.should have_selector('q', text: 'We love bringing pleasure')
    end

end
