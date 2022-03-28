require 'rails_helper'

RSpec.describe "/exercise_assignments", type: :request do
  describe "GET /index" do
    let!(:exercise_assignments) { FactoryBot.create_list(:exercise_assignment, 3) }

    it "renders a successful response" do
      get exercise_assignments_path
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    let(:member) { FactoryBot.create(:member) }
    let!(:exercise_assignment) { FactoryBot.create(:exercise_assignment, :completed, data: {"calm_level_before" => "2", "calm_level_after" => "7"}) }
    let(:params) { {exercise_assignment: {data: {"calm_level_before" => "8", "calm_level_after" => "4"} }} }

    it "updates an existing ExerciseAssignment" do
      expect {
        patch exercise_assignment_path(exercise_assignment), params: params
      }.to change { exercise_assignment.reload.data }
            .from({"calm_level_before" => "2", "calm_level_after" => "7"})
            .to ({"calm_level_before" => "8", "calm_level_after" => "4"})
    end
  end
end
