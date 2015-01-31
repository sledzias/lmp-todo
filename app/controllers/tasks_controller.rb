class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  protect_from_forgery with: :exception
  after_action :verify_authorized, :except => :index

  def index
    @tasks = policy_scope(Task)
  end

  def show
    authorize @task
  end

  def new
    @task = Task.new
    authorize @task
  end

  def edit
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
    authorize @task
  end

  def update
    authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:done, :description)
    end
end
