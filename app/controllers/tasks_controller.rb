class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_done]
  after_action :verify_authorized, except: [:create, :complete_all]
  after_action :verify_policy_scoped, only: :complete_all
  respond_to :html

  def new
    @task = Task.new
    respond_with @task
  end

  def edit
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    if not current_user.nil?
      @task.user_id = current_user.id
      @task.save
    end
    redirect_to tasks_path
  end

  def update
    authorize @task
    @task.update task_params
    respond_with @task
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to tasks_path
  end

  def toggle_done
    authorize @task
    @task.done = !@task.done
    @task.save
    redirect_to tasks_path
  end

  def complete_all
    @tasks = policy_scope(Task)
    @tasks.each do |t|
      t.done = true
      t.save
    end
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :done, :user_id)
    end
end
