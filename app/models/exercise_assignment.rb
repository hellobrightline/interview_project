# == Schema Information
#
# Table name: exercise_assignments
#
#  id           :integer          not null, primary key
#  completed_at :datetime
#  data         :json
#  due_by       :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  exercise_id  :string
#  member_id    :integer
#
# Indexes
#
#  index_exercise_assignments_on_member_id  (member_id)
#
class ExerciseAssignment < ApplicationRecord
  belongs_to :member

  validates_presence_of :exercise_id, :member_id

  delegate :kind, :url, :title, to: :exercise

  def exercise_id
    super&.to_sym
  end

  def exercise
    Exercise.find(exercise_id)
  end
end
