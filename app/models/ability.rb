class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post do |post|
      post.published?
    end

    admin_abilities if user
  end

  def admin_abilities
    can :manage, :all
  end
end
