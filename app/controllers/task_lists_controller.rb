class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :destroy]

  def show
    render_result serialize_records(@task_list)
  end

  def create
    list = TaskList.create!(create_params)

    render_result serialize_records(list)
  end

  def destroy
    @task_list.destroy!

    render_result
  end

  protected

  def set_task_list
    @task_list = TaskList.find(params[:id])
  end

  def serialize_records(records)
    TaskListSerializer.new(records, include: [:tasks]).serializable_hash
  end

  def create_params
    params.require(:task_list).permit(:name)
  end
end
