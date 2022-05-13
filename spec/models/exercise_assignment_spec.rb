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
require "rails_helper"

RSpec.describe ExerciseAssignment, type: :model do
  describe "#exercise" do
    it "loads the correct exercise based on the assigned id" do
      member = FactoryBot.create(:member)
      exercise_id = Exercise.ids.first

      assignment = FactoryBot.create(:exercise_assignment, member: member, exercise_id: exercise_id)

      expect(assignment.exercise).to eq(Exercise.find(exercise_id))
    end
  end

  describe "#status=" do
    context "if set to `completed`" do
      it "sets the complated_at timestamp" do
        member = FactoryBot.create(:member)
        exercise_id = Exercise.ids.first

        assignment = FactoryBot.create(:exercise_assignment, member: member, exercise_id: exercise_id)
        expect { assignment.update(status: "completed") }.to change { assignment.completed_at }.from(nil)
      end

      context "if the exercise was already completed" do
        it "does nothing" do
          member = FactoryBot.create(:member)
          exercise_id = Exercise.ids.first

          assignment = FactoryBot.create(:exercise_assignment, :completed, member: member, exercise_id: exercise_id)
          expect { assignment.update(status: "completed") }.not_to change { assignment.completed_at }
        end
      end
    end

    context "if set to false" do
      it "unsets the completed_at timestamp" do
        member = FactoryBot.create(:member)
        exercise_id = Exercise.ids.first

        assignment = FactoryBot.create(:exercise_assignment, :completed, member: member, exercise_id: exercise_id)

        expect { assignment.update(status: "pending") }.to change { assignment.completed_at }.to(nil)
      end
    end
  end
end
