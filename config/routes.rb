Rails.application.routes.draw do
  get "/tasks", to: 'visitors#index'
  post "tasks/clear_completed", to: 'tasks#clear_completed'
  post "tasks/toggle_all", to: 'tasks#toggle_all'
  post "/tasks/toggle_done/:id", to: 'tasks#toggle_done'
  resources :tasks

  root to: 'visitors#index'
  devise_for :users
end
