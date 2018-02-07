Rails.application.routes.draw do
  resources :task_lists, only: [:create, :show, :destroy] do
    resources :tasks
  end

  match '*path', to: 'application#routing_catch_all', via: :all
end
