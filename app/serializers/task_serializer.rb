class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :task_list_id,
              :list_index,
              :title,
              :description,
              :description_html,
              :status,
              :due_on,
              :created_at,
              :updated_at
end
