# @author Zamith
class Ability
  include CanCan::Ability

  def initialize(user)

    @user = user || Citygate::User.new # guest user (not logged in)

    can :index, :home
    can :read, Boss::Post

    if @user.role
      send(@user.role.name.downcase)
    end
  end

  def member
    can :read, Citygate::User
    can :update, Citygate::User, id: @user.id
  end

  def admin
    can :manage, :all
  end

end
