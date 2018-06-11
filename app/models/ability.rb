class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?  # additional permissions for administrators
      can :manage, User
      can :manage, Product
    else
      can :manage, User, id: user.id
      can :show, Product
      can :show, Comment
    end
  end

end
