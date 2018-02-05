# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Task.transaction do
  quest_list = TaskList.create!(name: "Quests at Riversend")

  quest_list.tasks.create!([
    {
      list_index: 0,
      title: 'Slay the medusa',
      description: "It's been turning all the dwarves to stone. *Don't make eye contact!* Reward: 200 gold pieces.",
      status: Task::STATUS_INCOMPLETE
    },
    {
      list_index: 1,
      title: 'Interrogate Kobold Gayfeather',
      description: "We captured the charlatan but he refuses to tell us where the dragon cult is plotting their coup.",
      status: Task::STATUS_IN_PROGRESS,
      due_on: Date.today + 1.week
    }
  ])
end
