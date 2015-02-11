class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if not user.nil?
        scope.where user_id: user.id
      end
    end
  end

  def update?
    check_user
  end

  def show?
    check_user
  end

  def edit?
    check_user
  end

  def destroy?
    check_user
  end

  def toggle_done?
    check_user
  end

  private
  def check_user
    user.id == record.user.id
  end
end