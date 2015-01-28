class TaskPolicy < ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end
  
  def toggle_done?
    @task.user_id == @user.id
  end

  def show?
    @task.user_id == @user.id
  end

  def update?
    @task.user_id == @user.id
  end

  def edit?
    @task.user_id == @user.id
  end

  def destroy?
    @task.user_id == @user.id
  end

  class Scope < Scope
    def resolve
      if @user.present?
        scope.where(:user_id => @user.id)
      else
        scope.where(:user_id => nil)
      end
    end
  end
end
