class RatingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @record.user != @user
  end

  def update?
    create?
  end
end
