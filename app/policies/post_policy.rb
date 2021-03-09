class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.where(user: user)
    end
  end

  # def index?
  #   true
  # end

  def show?
    true
  end

  def search?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    @record.user == @user
  end

  def edit?
    update?
  end

  def destroy?
    @record.user == @user
  end

end
