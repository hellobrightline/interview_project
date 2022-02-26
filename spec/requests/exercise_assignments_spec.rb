require 'rails_helper'

RSpec.describe "/exercise_assignments", type: :request do
  describe "GET /index" do
    let!(:exercise_assignments) { FactoryBot.create_list(:exercise_assignment, 3) }

    it "renders a successful response" do
      get exercise_assignments_path
      expect(response).to be_successful
    end
  end
end
