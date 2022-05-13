# frozen_string_literal: true

class SendPendingExerciseAssignmentNotificationJob < ApplicationJob
  def perform(member_id)
    member = Member.find(member_id)

    if member.pending_exercise_assignments.any?
      MemberMailer.with(member: member)
        .pending_exercise_assignments
        .deliver_now
    end
  end
end
