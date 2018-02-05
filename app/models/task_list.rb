class TaskList < ApplicationRecord
  has_many :tasks, -> { order(list_index: :asc) }

  validates :name, presence: true
end
