Rails.application.routes.draw do
  root to: "projects#index"
  resources :project_criteria
  resources :projects
  devise_for :users
end
