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

    it 'should begin life with :prospective role' do
      new_user.should have_role :prospective
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
    end

    context 'when is a full member' do
      let(:user) { FactoryGirl.build(:full_member) }

      it { should be_able_to(:edit, user) }
      it { should be_able_to(:view, Content.vision) }
      it { should_not be_able_to(:view, Content.values) }
    end

    context 'when is a prospective member' do
      let(:user) { FactoryGirl.build(:prospective) }

      it { should be_able_to(:edit, user) }
      it { should be_able_to(:view, Content.vision) }
      it { should_not be_able_to(:view, Content.values) }
    end

    context 'when is a guest' do
      it { should be_able_to(:view, Content.vision) }
      it { should_not be_able_to(:view, Content.values) }
    end

  end


end