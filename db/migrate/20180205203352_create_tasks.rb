class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :task_list, foreign_key: true
      t.integer :list_index
      t.string :title
      t.text :description
      t.string :status
      t.date :due_on

      t.timestamps
    end
  end
end
