Rails.application.routes.draw do
  resources :members
  resources :exercise_assignments, only: [:index, :update]
end
