require 'spec_helper'

describe User do
  it 'should seed the admin user in the database' do
    User.find_for_database_authentication(login: "macosgrove").should_not be_nil
  end

  describe "Member of general public" do
    let(:user) { FactoryGirl.build(:user) }
    it 'should not be a member' do
      user.is_member?.should be_false
    end

  end

  describe "Founder" do
    let(:founder) { FactoryGirl.build(:founder) }
    it 'should be allowed to create and update users' do
      ability = Ability.new(founder)
      ability.should be_able_to(:create, User)
      ability.should be_able_to(:update, User)
    end
    it 'should be a member' do
      founder.is_member?.should be_true
    end
  end

  describe "probationer member" do
    let(:probie) { FactoryGirl.build(:probationer) }
    it 'should not be allowed to create or update users' do
      ability = Ability.new(probie)
      ability.should_not be_able_to(:create, User)
      ability.should_not be_able_to(:update, User)
    end
    it 'should be a member' do
      probie.is_member?.should be_true
    end
  end

end