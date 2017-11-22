Rails.application.routes.draw do
  root to: "projects#index"
  resources :project_criteria
  resources :projects do
      post 'select', on: :member
      post 'deselect', on: :member 
      get 'selected', on: :collection     
  end
  devise_for :users
end
