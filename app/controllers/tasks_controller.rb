class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: :create
  respond_to :html

  def new
    @task = Task.new
    respond_with @task
  end

  def edit
    authorize @task
  end

  def create
    @task = Task.new task_params
    @task.save
    respond_with @task
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

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :done, :user_id)
    end
end
