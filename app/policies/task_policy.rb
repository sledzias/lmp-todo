class TaskPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      user.tasks
    end
  end

  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end
  
  def policy?
    task.user==user
  end
  
  alias_method :mark_as_complete?, :policy?
  alias_method :update?, :policy?
  alias_method :destroy?, :policy?
  
end