Rails.application.routes.draw do
  resources :tasks, except: :index
  get '/tasks' => redirect('/')

  root to: 'visitors#index'
  devise_for :users
end
