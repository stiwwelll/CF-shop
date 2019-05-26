class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Product
    can :manage, Comment
  end

end
