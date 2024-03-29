class TasksController < ApplicationController


def index
  @tasks = Task.all
end

def show
  @task = Task.find(params[:id])
end

def new
end

def create
  new_task = Task.new(task_params)
  new_task.save
  redirect_to tasks_path(new_task)
end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  @task.update(task_params)
  redirect_to tasks_path(@task)
end

def destroy
  @task = Task.find(params[:id])
  @task.destroy
  redirect_to tasks_path
end



private

def task_params
  params.require(:task).permit(:title, :detail)
end


end
