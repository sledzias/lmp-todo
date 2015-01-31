class TaskPolicy < ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
  	raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @task = task
  end

  def match?
  	user
  end

  def create?
    user
  end

  def new?
    create?
  end
	def edit?
    update?
  end
end
