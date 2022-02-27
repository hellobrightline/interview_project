class AddDueByToExerciseAssignments < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_assignments, :due_by, :timestamp
  end
end
