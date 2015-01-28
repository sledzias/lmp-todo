class TaskPolicy < ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
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
    scope.where(:user_id => @user.id)
  end
end
end
