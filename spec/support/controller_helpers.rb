module ControllerSupport
  def login_founder
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:founder)
  end

  def login_member
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:full_member)
  end
end