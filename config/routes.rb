Rails.application.routes.draw do
  get '/tasks', to: 'visitors#index'
  get '/tasks/:id/toggle', to: 'tasks#toggle_done', as: 'task_toggle'
  resources :tasks, only: [:create, :destroy]
  root to: 'visitors#index'
  devise_for :users
end
