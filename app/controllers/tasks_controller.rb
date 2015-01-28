class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_done]
  after_action :verify_authorized, :except => [:index, :new, :create, :toggle_all]
  after_action :verify_policy_scoped, :only => [:index, :toggle_all]

  def toggle_all
    tasks = policy_scope(Task)
    tasks.each do |task| 
      unless task.available?
        task.done = true
        task.save
      end
    end
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def toggle_done
    authorize @task
    @task.done? ? @task.done = false : @task.done = true
    @task.save
    respond_to do |format|
      format.json {render :json => @task.done}
    end
  end

  def index
    @tasks = policy_scope(Task)
  end

  def show
    authorize @task
  end

  def new
    @task = Task.new
  end

  def edit
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :json => {
          :location => url_for(:controller => 'tasks', :action => 'index'),
          :task => @task}
         }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:done, :description, :user_id)
  end
end