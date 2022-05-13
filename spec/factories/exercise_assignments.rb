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
FactoryBot.define do
  factory :exercise_assignment do
    member
    exercise_id { Exercise.ids.sample }

    trait :pending do
      status { "pending" }
    end

    trait :completed do
      status { "completed" }
    end
  end
end
