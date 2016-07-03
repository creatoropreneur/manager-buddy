class Ability
  include CanCan::Ability

  def initialize(user)
    if user.project_manager?
      can :manage, :all
    else

    end
  end
end
