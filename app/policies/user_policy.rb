class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user == current_user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
