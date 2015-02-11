Rails.application.routes.draw do
  get '/tasks', to: 'visitors#index'
  resources :tasks, only: :create
  root to: 'visitors#index'
  devise_for :users
end
