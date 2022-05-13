# frozen_string_literal: true

require "rails_helper"

RSpec.describe PendingExerciseAssignmentNotification do
  describe ".send_to_members" do
    it "enqueues a job per member" do
      FactoryBot.create_list(:exercise_assignment, 3, :pending)
      FactoryBot.create(:exercise_assignment, :completed)

      expect {
        described_class.send_to_members
      }.to enqueue_job(SendPendingExerciseAssignmentNotificationJob).exactly(3).times
    end
  end
end
