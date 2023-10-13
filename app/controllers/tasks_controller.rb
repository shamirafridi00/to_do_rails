class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end



  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully.'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task deleted successfully.'
  end



  def mark_as_done
    @task = Task.find(params[:id])
    @task.update(completed: true)
    redirect_to tasks_path, notice: 'Task marked as done.'
  end

  # ...

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

end
