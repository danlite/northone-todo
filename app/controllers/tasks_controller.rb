class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :set_task_list, only: [:create, :index]

  def index
    render_result serialize_records(@task_list.tasks)
  end

  def show
    render_result serialize_records(@task)
  end

  def create
    task = @task_list.tasks.create!(create_params)

    render_result serialize_records(task)
  end

  def update
    @task.update!(create_params)

    render_result serialize_records(@task)
  end

  def destroy
    @task.destroy!

    render_result
  end

  protected

  def set_task
    @task = Task.find(params[:id])
  end

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def serialize_records(records)
    TaskSerializer.new(records).serializable_hash
  end

  def create_params
    params.require(:task).permit(:list_index, :title, :description, :status, :due_on)
  end
end
