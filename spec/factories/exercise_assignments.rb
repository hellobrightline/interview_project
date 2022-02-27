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
FactoryBot.define do
  factory :exercise_assignment do
    member
    exercise_id { Exercise.ids.sample }

    trait :completed do
      completed_at { Time.now }
    end

    trait :with_due_date do
      due_by { Faker::Date.forward(days: 30) }
    end
  end
end
