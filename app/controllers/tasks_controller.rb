class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    find
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    find
  end

  def update
    find
    @task.update(task_params)
    redirect_to tasks_path
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    find
    @task.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def find
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
