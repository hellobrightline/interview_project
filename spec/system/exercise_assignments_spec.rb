require 'rails_helper'

RSpec.describe "/exercise_assignments", type: :system do
  scenario "viewing exercise assignments" do
    FactoryBot.create(:exercise_assignment, exercise_id: :all_about_me)
    FactoryBot.create(:exercise_assignment, exercise_id: :behavior_observation_chart)

    visit exercise_assignments_path

    expect(page).to have_content("All About Me")
    expect(page).to have_content("Behavior Observation Chart")
  end
end
