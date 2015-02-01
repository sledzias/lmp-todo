Rails.application.routes.draw do
  root to: 'tasks#all'
  devise_for :users
  
  get 'tasks' => 'tasks#all'
  get 'tasks/completed' => 'tasks#completed'
  get 'tasks/active' => 'tasks#active'
  get 'tasks/all' => 'tasks#all'
  
  post 'tasks/:id/mark_as_complete' => 'tasks#mark_as_complete'
  post 'tasks/create' => 'tasks#create'
  post 'tasks/clear_completed' => 'tasks#clear_completed'
  post 'tasks/mark_all_as_complete' => 'tasks#mark_all_as_complete'
  
  delete 'tasks/:id/destroy' => 'tasks#destroy'
  
  patch 'tasks/:id/update' => 'tasks#update'
  
end
