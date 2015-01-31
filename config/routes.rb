Rails.application.routes.draw do
  resources :tasks

  root to: 'visitors#index'
  devise_for :users
end
