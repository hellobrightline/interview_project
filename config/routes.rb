# frozen_string_literal: true

Rails.application.routes.draw do
  # Routes in this namespace are internal endpoints for admin purposes
  namespace :admin do
    resources :members
    resources :exercise_assignments, only: [:index, :create]
  end

  # Routes in this namespace are designated to be used by our members
  namespace :members do
    resources :exercise_assignments, only: [:index, :update]
  end
end
