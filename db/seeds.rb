# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Use `CLEAR=true rails db:seed` to clear existing records and start from scratch
if ENV["CLEAR"]
  Member.delete_all
  ExerciseAssignment.delete_all
end

250.times do |i|
  name = Faker::FunnyName.two_word_name.split(" ")
  Member.create(first_name: name.first, last_name: name.last, date_of_birth: Faker::Date.birthday)
end

(2..7).each do |i|
  Member.where("id % #{i} = 0").each do |member|
    ExerciseAssignment.create(
      member: member,
      exercise_id: Exercise.ids.sample,
      completed_at: [Faker::Date.backward, nil].sample,
      due_by: rand > 0.5 ? Faker::Date.between(from: 30.days.ago, to: 30.days.from_now) : nil
    )
  end
end
