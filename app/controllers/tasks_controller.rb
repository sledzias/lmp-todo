class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_task, only: [:mark_as_complete, :update, :destroy]
  before_action :authorize_task, only: [:mark_as_complete, :update, :destroy]
   
  def mark_as_complete
    @task.mark_as_complete
    execute_redirect(tasks_path)
  end
  def all
    @tasks = get_tasks
    render template: 'visitors/index'
  end
  
  private
  
    def authorize_task
      authorize @task
    end
  
    def get_task
      @task = Task.find(params[:id])
    end

    def get_tasks
      policy_scope(Task)
    end


    def execute_redirect(target, notice=nil, alert=nil)
      flash[:notice] = notice unless notice.nil?
      flash[:alert] = alert unless alert.nil?
      if request.xhr?
        render :js => "window.location = '#{target}'"
      else
        redirect_to target
      end
    end
end
