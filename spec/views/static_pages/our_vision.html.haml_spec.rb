require 'spec_helper'

describe "static_pages/our_vision.html.haml" do

    it "should render Our Vision" do
      render
      rendered.should have_selector('blockquote', text: 'We love bringing pleasure')
    end

end
