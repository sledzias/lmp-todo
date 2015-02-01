class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_task, only: [:mark_as_complete, :update, :destroy]
   
  def all
    @tasks = get_tasks
    render template: 'visitors/index'
  end
  
  private
  
    def get_tasks
      policy_scope(Task)
    end

end
