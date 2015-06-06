class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, User, user: user if user
    can :manage, UserTask, user: user if user
  end
end
