# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # usually this is the first thing you do but I am using devise so it dons't really matter
  # user ||= User.new # guest user (not logged in)

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.user_manager?
      can :manage, User
    else
      can :manage, JoggingTime, user_id: user.id
    end
  end
end
