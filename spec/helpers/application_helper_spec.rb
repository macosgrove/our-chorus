require "spec_helper"

describe ApplicationHelper do
  describe "#our_user" do
    it "creates a new guest user" do
      our_user.should be_a_new(User)
      our_user.roles.should be_empty
    end

  end
end