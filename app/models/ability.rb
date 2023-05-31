# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role == 'Editor'
      can :manage, PowerGauge, user_id: user.id
      can :manage, Measurement
    else
      can :read, PowerGauge
      can :read, Review
    end

    if user.role == 'Manager'
      can :manage, Review
      can :read, Measurement
    end
  end
end