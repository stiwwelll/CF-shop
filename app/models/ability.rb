class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Product
    can :read, Comment
    if user.present?
      can :manage, User, id: user.id
      if user.admin?
        can :manage, User
        can :manage, Product
      end
    end
  end

end
