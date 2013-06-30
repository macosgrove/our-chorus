require 'spec_helper'

describe Role do
  it 'should return assignable roles' do
    assignable = Role.assignable_roles.map{|role| role.name.to_sym}
    assignable.should include :prospective
    assignable.should include :provisional
    assignable.should include :full_member
    assignable.should include :past_member
    assignable.should include :course_attendee
    assignable.should_not include :founder
    assignable.should_not include :developer
  end
  
  it 'should return non-assignable roles' do
    non_assignable = Role.non_assignable_roles.map{|role| role.name.to_sym}
    non_assignable.should_not include :prospective
    non_assignable.should_not include :provisional
    non_assignable.should_not include :full_member
    non_assignable.should_not include :past_member
    non_assignable.should_not include :course_attendee
    non_assignable.should include :founder
    non_assignable.should include :developer
  end

  it 'should return a friendly label' do
    member = Role.find_or_create_by(name: "full_member")
    member.label.should eq("Full member")
    member = Role.find_or_create_by(name: "prospective")
    member.label.should eq("Prospective")
  end
end


