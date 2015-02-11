Rails.application.routes.draw do
  get '/tasks', to: 'visitors#index'
  get '/tasks/:id/toggle', to: 'tasks#toggle_done', as: 'task_toggle'
  get '/tasks/complete_all', to: 'tasks#complete_all', as: 'complete_all_tasks'
  resources :tasks, only: [:create, :destroy]
  root to: 'visitors#index'
  devise_for :users
end
