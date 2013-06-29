require 'spec_helper'

describe "static_pages/course_materials.html.haml" do
  it "should render Course Materials" do
    render
    rendered.should have_selector('h1', text: 'Course Materials')
  end
end
