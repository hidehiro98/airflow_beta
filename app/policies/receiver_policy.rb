class ReceiverPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def accept?
    record.user == user
  end

  def reject?
    record.user == user
  end
end
