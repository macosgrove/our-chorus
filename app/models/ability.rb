class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in)
    can :view, Content, :type => :vision
    can :view, Content, :type => :values
    can :view, Content, :type => :grow
    can :list, User
    if user.has_role? :prospective
      can :edit, User, :username => user.username
    end
    if user.is_member?
      can :edit, User, :username => user.username
       if user.has_role? :full_member
        can :manage, User
      end
      if user.has_role? :founder
        can :manage, :all
      end
    end
    if user.has_role? :developer
      can :manage, :all
    end
  end
end
