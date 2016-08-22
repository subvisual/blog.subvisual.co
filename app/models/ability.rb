class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    user_abilities
    admin_abilities
  end

  private

  attr_reader :user

  def user_abilities
    can :read, Post, &:published?
  end

  def admin_abilities
    return unless user

    can :manage, :all
  end
end
