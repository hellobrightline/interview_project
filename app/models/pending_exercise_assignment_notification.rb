# frozen_string_literal: true

class PendingExerciseAssignmentNotification
  def self.send_to_members
    Member.with_pending_exercise_assignments.find_each do |member|
      SendPendingExerciseAssignmentNotificationJob.perform_later(member.id)
    end
  end
end
