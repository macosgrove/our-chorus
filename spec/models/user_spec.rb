require 'spec_helper'

describe User do
  it 'should seed the admin user in the database' do
    User.find_for_database_authentication(login: "macosgrove").should_not be_nil
  end

  describe "Founder" do
    it 'should be allowed to create and update users' do
      admin = FactoryGirl.build(:founder)
      ability = Ability.new(admin)
      ability.should be_able_to(:create, User)
      ability.should be_able_to(:update, User)
    end
  end

  describe "Probationary member" do
    it 'should not be allowed to create or update users' do
      probie = FactoryGirl.build(:probationary)
      ability = Ability.new(probie)
      ability.should_not be_able_to(:create, User)
      ability.should_not be_able_to(:update, User)
    end
  end

end