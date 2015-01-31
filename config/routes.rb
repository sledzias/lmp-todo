Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :tasks
    end
  end
  root to: 'visitors#index'

  get '*path', to: 'visitors#index'
end
