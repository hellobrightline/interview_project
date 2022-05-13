# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/exercise_assignments", type: :request do
  describe "GET /index" do
    let!(:member) { FactoryBot.create(:member) }
    let!(:other_member) { FactoryBot.create(:member) }
    let!(:incomplete_exercise_assignments) {
      [
        FactoryBot.create(:exercise_assignment, :pending, member: member, exercise_id: Exercise.ids.first),
        FactoryBot.create(:exercise_assignment, :pending, member: member, exercise_id: Exercise.ids.second)
      ]
    }
    let!(:completed_exercise_assignments) { FactoryBot.create(:exercise_assignment, :completed, member: member) }
    let!(:other_exercise_assignment) { FactoryBot.create(:exercise_assignment, member: other_member) }

    it "returns the members pending exercise assignments" do
      get members_exercise_assignments_path(member_id: member.id, format: :json)

      expect(response).to be_successful

      returned_exercise_assignments = JSON.parse(response.body)
      expect(returned_exercise_assignments.size).to eq(2)
    end
  end

  describe "PATCH /update" do
    let(:member) { FactoryBot.create(:member) }
    let!(:exercise_assignment) { FactoryBot.create(:exercise_assignment, member: member, response: {}) }
    let(:params) { {exercise_assignment: {response: {"calm_level_before" => "8", "calm_level_after" => "4"}, status: "completed"}} }

    context "with status set to completed" do
      it "completes the exercise" do
        expect {
          patch members_exercise_assignment_path(exercise_assignment), params: params.merge(member_id: member.id)
          exercise_assignment.reload
        }.to change { exercise_assignment.response }.from({}).to({"calm_level_before" => "8", "calm_level_after" => "4"})
          .and change { exercise_assignment.completed? }.from(false).to(true)
      end
    end
  end
end
