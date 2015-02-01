Rails.application.routes.draw do
  root to: 'tasks#all'
  devise_for :users
  
  get 'tasks' => 'tasks#all'
  get 'tasks/all' => 'tasks#all'
end
