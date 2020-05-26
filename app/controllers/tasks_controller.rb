class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # needed to send an empty instance for the form
  end

  # don't need a create view:
  def create
    @task = Task.new(task_params)
    @task.save!

    redirect_to task_path(@task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  # don't need a create view:
  def update
    @task = Task.find(params[:id]) # why find again?
    @task.update(task_params)
    @task.save!

    redirect_to task_path(@task.id)
  end

  # don't need a create view:
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  # Strong params (prevent user to hack the form & corrupt the db)
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
