class Task < ApplicationRecord
  STATUSES = [
    STATUS_INCOMPLETE   = 'incomplete',
    STATUS_IN_PROGRESS  = 'in_progress',
    STATUS_COMPLETE     = 'complete'
  ]

  belongs_to :task_list

  validates :title, presence: true
  validates :status, inclusion: { in: Task::STATUSES }
  validates :task_list, presence: true
  validates :list_index, uniqueness: { scope: :task_list_id }

  before_validation :set_initial_values, on: :create

  def set_initial_values
    self.status ||= Task::STATUS_INCOMPLETE

    if self.task_list
      self.list_index ||= self.task_list.tasks.count
    end
  end
end
