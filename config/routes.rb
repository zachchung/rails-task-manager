Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"

  # See all tasks
  get "tasks", to: "tasks#index"

  # Create a new task (put above all /:id otherwise treat "new" as "id" -> crash)
  get "tasks/new", to: "tasks#new", as: :new_task
  post "tasks", to: "tasks#create" # post by the form

  # See one task
  get "tasks/:id", to: "tasks#show", as: :task # need alias for all "tasks/sth" pages

  # Update a task
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "tasks/:id", to: "tasks#update" # patch by the form?

  # Destroy a task
  delete "tasks/:id", to: "tasks#destroy"
end
