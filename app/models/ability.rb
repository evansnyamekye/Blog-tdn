class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is? :admin
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can %i[create update destroy], Post, user_id: user.id
    end
  end
end
