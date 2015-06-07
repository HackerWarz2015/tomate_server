class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, User, id: user.id
      can :manage, UserTask, id: user.id
      can :manage, Friendship, id: user.id
      can :manage, Reward, id: user.id
    end
  end
end
