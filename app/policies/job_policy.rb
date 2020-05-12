class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    if user
      record.company.user == user
    else
      return true
    end
  end

  def show?
    return true
  end

  def update?
    record.company.user == user
  end

end
