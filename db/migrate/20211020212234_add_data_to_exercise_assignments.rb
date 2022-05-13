# frozen_string_literal: true

class AddDataToExerciseAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :exercise_assignments, :response, :jsonb, default: {}
  end
end
