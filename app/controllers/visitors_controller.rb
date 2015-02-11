class VisitorsController < ApplicationController
  after_action :verify_policy_scoped, only: :index

  def index
    @task = Task.new
    @tasks = policy_scope(Task)
  end
end
