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
require "rails_helper"

RSpec.describe ExerciseAssignment, type: :model do
  describe "#exercise" do
    it "loads the correct exercise based on the assigned id" do
      member = FactoryBot.create(:member)
      exercise_id = Exercise.ids.sample

      assignment = FactoryBot.create(:exercise_assignment, member: member, exercise_id: exercise_id)

      expect(assignment.exercise).to eq(Exercise.find(exercise_id))
    end
  end
end
