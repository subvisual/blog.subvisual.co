class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post.all_published

    admin_abilities(user) if user
  end

  def admin_abilities(user)
    can :manage, :all
  end

end
