class TaskPolicy < ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def match?
  	user
  end
end
