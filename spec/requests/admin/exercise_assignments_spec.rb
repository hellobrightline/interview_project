# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/admin/exercise_assignments", type: :request do
  describe "GET /index" do
    let!(:exercise_assignments) { FactoryBot.create_list(:exercise_assignment, 3) }

    it "renders a successful response" do
      get admin_exercise_assignments_path
      expect(response).to be_successful
    end
  end

  describe "POST /exercise_assignment" do
    it "creates a new exercise assignment for a given member" do
      member = FactoryBot.create(:member)
      params = {member_id: member.id, exercise_id: Exercise.ids.first}

      expect {
        post admin_exercise_assignments_path, params: {exercise_assignment: params}
      }.to change(ExerciseAssignment, :count).by(1)
    end
  end
end
