# frozen_string_literal: true

class CreateExerciseAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_assignments do |t|
      t.references :member
      t.string :exercise_id, null: false
      t.string :status, null: false, default: "pending"
      t.timestamp :completed_at

      t.timestamps

      t.index ["exercise_id", "member_id"], unique: true, where: 'status = "pending"'
    end
  end
end
