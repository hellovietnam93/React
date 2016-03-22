class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :manage, Record
      can [:index, :show], User
      can :manage, Post, user_id: user.id
    end
  end
end
