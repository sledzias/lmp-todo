Rails.application.routes.draw do
  get '/tasks', to: 'visitors#index'

  root to: 'visitors#index'
  devise_for :users
end
