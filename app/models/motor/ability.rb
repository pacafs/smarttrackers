# frozen_string_literal: true
class Motor::Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == 'Editor'
      can :manage, PowerGauge, user_id: user.id
    else
      can :read, PowerGauge
    end

    if user.role == 'Manager'
      can :manage, Review
    end
  end
end