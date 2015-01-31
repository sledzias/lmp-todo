class Api::V1::TasksController < ApplicationController
  respond_to :json

  def index
    respond_with Task.all
  end

  def show
    respond_with task
  end

  def create
    respond_with :api, :v1, Task.create(lead_params)
  end

  def update
    respond_with task.update(lead_params)
  end

  def destroy
    respond_with task.destroy
  end

  private

  def task
    Task.find(params[:id])
  end

  def lead_params
    params.require(:task).permit(:done, :description, :user_id)
  end

end
