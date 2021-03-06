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

  describe "Course attendee" do
    let(:user) { FactoryGirl.build(:course_attendee) }
    it 'should not be a member' do
      user.is_member?.should be_false
    end

  end

  describe "Past member" do
    let(:user) { FactoryGirl.build(:past_member) }
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

  describe "prospective member" do
    let(:prospective) { FactoryGirl.build(:prospective) }
    it 'should not be allowed to create or update other users' do
      ability = Ability.new(prospective)
      ability.should_not be_able_to(:create, User)
      ability.should_not be_able_to(:update, User)
    end
    it 'should not be a member' do
      prospective.is_member?.should be_false
    end
  end

  describe "provisional member" do
    let(:provisional) { FactoryGirl.build(:provisional) }
    it 'should not be allowed to create or update other users' do
      ability = Ability.new(provisional)
      ability.should_not be_able_to(:create, User)
      ability.should_not be_able_to(:update, User)
    end
    it 'should be a member' do
      provisional.is_member?.should be_true
    end
  end

  describe "default new user" do
    let(:new_user) { FactoryGirl.create(:user) }
    it 'should begin life with :prospective role' do
      new_user.should have_role :prospective
    end
  end

  describe "saving" do
    let!(:new_user) { FactoryGirl.create(:user,
                                         first_name: 'Mary', last_name: 'Smith', username: 'msmith',
                                         mobile: '12345', about_me: 'This is my song.', email: 'mary.smith@example.com') }

    it 'should save all fields to the database' do
      mary = User.where(username: 'msmith').first
      mary.first_name.should eq('Mary')
      mary.last_name.should eq('Smith')
      mary.mobile.should eq('12345')
      mary.about_me.should eq('This is my song.')
      mary.email.should eq('mary.smith@example.com')
    end

    it 'should have unique email address' do
      expect { FactoryGirl.create(:user, email: 'mary.smith@example.com') }.to raise_error(Mongoid::Errors::Validations)
    end

    it 'should have unique username' do
      expect { FactoryGirl.create(:user, username: 'msmith') }.to raise_error(Mongoid::Errors::Validations)
    end

  end

  describe "after create" do
    it "should send welcome email" do
      welcome_email = mock('email')
      UserMailer = mock('mailer').as_null_object
      UserMailer.should_receive(:welcome_email).and_return(welcome_email)
      welcome_email.should_receive(:deliver)
      FactoryGirl.create(:user, send_emails: true)
    end
    it "should send notification email" do
      notification_email = mock('email')
      UserMailer = mock('mailer').as_null_object
      UserMailer.should_receive(:notification_email).and_return(notification_email)
      notification_email.should_receive(:deliver)
      FactoryGirl.create(:user, send_emails: true)
    end
  end

  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'when is the founder' do
      let(:user) { FactoryGirl.build(:founder) }

      it { should be_able_to(:manage, User.new) }
      it { should be_able_to(:view, Content.vision) }
      it { should be_able_to(:view, Content.values) }
      it { should be_able_to(:view, Content.music) }
      it { should be_able_to(:view, Content.grow) }
      it { should be_able_to(:view, Content.materials) }
    end

    context 'when is a full member' do
      let(:user) { FactoryGirl.build(:full_member) }

      it { should be_able_to(:edit, user) }
      it { should_not be_able_to(:list, User) }
      it { should_not be_able_to(:view, Content.vision) }
      it { should be_able_to(:view, Content.values) }
      it { should_not be_able_to(:view, Content.grow) }
      it { should_not be_able_to(:view, Content.music) }
      it { should be_able_to(:view, Content.materials) }
    end

    context 'when is a prospective member' do
      let(:user) { FactoryGirl.build(:prospective) }

      it { should be_able_to(:edit, user) }
      it { should_not be_able_to(:view, Content.vision) }
      it { should be_able_to(:view, Content.values) }
      it { should_not be_able_to(:view, Content.grow) }
      it { should_not be_able_to(:view, Content.music) }
      it { should_not be_able_to(:view, Content.materials) }
    end

   context 'when is a provisional member' do
      let(:user) { FactoryGirl.build(:provisional) }

      it { should be_able_to(:edit, user) }
      it { should_not be_able_to(:view, Content.vision) }
      it { should be_able_to(:view, Content.values) }
      it { should_not be_able_to(:view, Content.grow) }
      it { should_not be_able_to(:view, Content.music) }
      it { should be_able_to(:view, Content.materials) }
    end

    context 'when is a guest' do
      it { should be_able_to(:view, Content.dream) }
      it { should_not be_able_to(:list, User) }
      it { should_not be_able_to(:view, Content.vision) }
      it { should be_able_to(:view, Content.values) }
      it { should_not be_able_to(:view, Content.grow) }
      it { should_not be_able_to(:view, Content.music) }
      it { should_not be_able_to(:view, Content.materials) }
    end

  end

  describe 'status change' do

    context 'when is founder' do
      let(:user) { FactoryGirl.create(:founder) }
      it 'should progress to full but retain founder' do
        user.set_status(:full_member)
        user.has_role?(:full_member).should be_true
        user.has_role?(:provisional).should be_false
        user.has_role?(:founder).should be_true
        user.is_member?.should be_true
      end
    end

    context 'when is provisional' do
      let(:user) { FactoryGirl.create(:provisional) }
      it 'should progress to full member' do
        user.set_status(:full_member)
        user.has_role?(:full_member).should be_true
        user.has_role?(:provisional).should be_false
        user.is_member?.should be_true
      end
    end

    context 'when is full member' do
      let(:user) { FactoryGirl.create(:full_member) }
      it 'should progress to past member' do
        user.set_status(:past_member)
        user.has_role?(:full_member).should be_false
        user.is_member?.should be_false
        user.has_role?(:past_member).should be_true
      end
    end


  end


end