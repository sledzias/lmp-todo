class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_counters, only: [:all, :active, :completed]
  before_action :get_task, only: [:mark_as_complete, :update, :destroy]
  before_action :authorize_task, only: [:mark_as_complete, :update, :destroy]
   
  def mark_as_complete
    @task.mark_as_complete
    execute_redirect(tasks_path)
  end
  
  def mark_all_as_complete
    get_tasks.where(done:false).update_all(done: true)
    execute_redirect(tasks_path, "All tasks marked successfully.")
  end
  def destroy
    authorize @task
    @task.destroy
    execute_redirect(tasks_path, "Task destroyed successfully.")
  end
  
  def completed
    @tasks = get_tasks.where(:done=>true)
    render_default_template
  end
  
  def all
    @tasks = get_tasks
    render_default_template
  end
  
  def active
    @tasks = current_user.tasks.where(:done=>false)
    render_default_template
  end
  
  private
  
    def authorize_task
      authorize @task
    end
  
    def set_counters
      @all_counter = get_tasks.count
      @active_counter = get_tasks.where(:done=>false).count
      @completed_counter = @all_counter-@active_counter
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
  
    def render_default_template
      render template: 'tasks/index'
    end
  
end
