class UserPolicy < ApplicationPolicy
  # def initialize(user, record)
  #   @user = user
  #   @record = record
  # end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    record == user
  end

end
