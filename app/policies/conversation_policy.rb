class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(sender: user).or(scope.where(receiver: user)) 
    end
  end


  def show?
    record.sender == user || record.receiver == user
  end

  def create?
    true
  end

end
