class VisitorsController < ApplicationController
  def index
    
    if params[:filter] == 'all'
      @tasks = policy_scope(Task)
    elsif params[:filter] == 'active'
      @tasks = policy_scope(Task).active_tasks
    elsif params[:filter] == 'completed'
      @tasks = policy_scope(Task).finished_tasks
    else
      @tasks = policy_scope(Task)
    end
    
  end
end
