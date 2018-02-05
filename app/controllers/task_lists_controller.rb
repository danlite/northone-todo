class TaskListsController < ApplicationController
  def show
    list = TaskList.find(params[:id])

    render_result serialize_records(list)
  end

  def create
    list = TaskList.create!(create_params)

    render_result serialize_records(list)
  end

  protected

  def serialize_records(records)
    TaskListSerializer.new(records, include: [:tasks]).serializable_hash
  end

  def create_params
    params.require(:task_list).permit(:name)
  end
end
