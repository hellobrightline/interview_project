# frozen_string_literal: true

# == Schema Information
#
# Table name: exercise_assignments
#
#  id           :integer          not null, primary key
#  completed_at :datetime
#  response     :json
#  status       :string           default("pending"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  exercise_id  :string           not null
#  member_id    :integer
#
# Indexes
#
#  index_exercise_assignments_on_exercise_id_and_member_id  (exercise_id,member_id) UNIQUE WHERE status = "pending"
#  index_exercise_assignments_on_member_id                  (member_id)
#
class ExerciseAssignment < ApplicationRecord
  belongs_to :member
  enum :status, {pending: "pending", completed: "completed"}

  validates :exercise_id, presence: true, inclusion: {in: Exercise.ids, allow_blank: true}

  before_save :set_completed_at

  delegate :kind, :url, :title, to: :exercise

  def exercise
    Exercise.find(exercise_id)
  end

  private

  def set_completed_at
    if completed?
      self.completed_at ||= Time.zone.now
    else
      self.completed_at = nil
    end
  end
end
