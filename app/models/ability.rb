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
    can :read, Post do |post|
      post.published?
    end
  end

  def admin_abilities
    return unless user

    can :manage, :all
  end
end
